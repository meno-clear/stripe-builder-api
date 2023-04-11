class StripeService

  def self.get_customer(current_user)
    if current_user.customer_id.present?
      return customer = Stripe::Customer.retrieve(current_user[:customer_id])
    else
      customer = Stripe::Customer.create(
        name: "#{current_user[:name]} #{current_user[:last_name]}",
        email: current_user[:email],
        description: "Customer for #{current_user[:email]}"
      )
      current_user.update(customer_id: customer.id)

      return customer
    end
  end

  def self.create_payment(orders, customer, payment_method)
    payment_intent = Stripe::PaymentIntent.create(
      amount: orders.sum(&:price_in_cents),
      currency: 'brl',
      customer: customer.id,
      payment_method_types: [payment_method]
    )

    payment = Payment.new(status: 'pending', customer_id: customer.id, payment_intent_id: payment_intent.id)
    orders.sum(&:price_in_cents)
    if payment.save
      orders.each do |order|
        order.update(payment_id: payment.id)
      end
      return payment
    else
      return { error: payment.errors }
    end
  end

  def self.confirm_payment(payment)
    payment_intent = Stripe::PaymentIntent.retrieve(payment.payment_intent_id)
    payment.update(status: payment_intent.status)
    return payment
  end

  def self.create_new_payments_method(current_user)
    ephemeralKey = Stripe::EphemeralKey.create({
      customer: current_user[:customer_id],
    }, {stripe_version: '2020-08-27'})
    setupIntent = Stripe::SetupIntent.create({
      customer: current_user[:customer_id]
    })

    return { customer: current_user[:customer_id], ephemeralKey: ephemeralKey[:secret], setupIntent: setupIntent[:client_secret], publishableKey: ENV['STRIPE_PUBLISHABLE_KEY']}
  end
end