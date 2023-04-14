class StripeService

  def self.get_customer(current_user)
    begin
      if current_user.customer_id.present?
        customer = Stripe::Customer.retrieve(current_user[:customer_id])
      else
        customer = Stripe::Customer.create(
          name: "#{current_user[:name]} #{current_user[:last_name]}",
          email: current_user[:email],
          description: "Customer for #{current_user[:email]}"
        )
        current_user.update(customer_id: customer.id)
        customer
      end
    rescue Stripe::StripeError => error
      {error: error.message }
    end
  end

  def self.create_payment(orders, customer, payment_method)
    begin
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
        payment
      else
        { error: payment.errors }
      end
    rescue Stripe::StripeError => error
      {error: error.message }
    end
  end

  def self.confirm_payment(payment)
    begin
      payment_intent = Stripe::PaymentIntent.retrieve(payment.payment_intent_id)
      payment.update(status: payment_intent.status)

      payment
    rescue Stripe::StripeError => error
      {error: error.message }
    end
  end

  def self.attach_new_payments_method(current_user, payment_id)
    begin
      Stripe::PaymentMethod.attach(
        payment_id,
        {customer: current_user[:customer_id]}
      )
    rescue Stripe::StripeError => error
      {error: error.message }
    end
  end

  def self.get_payment_methods(current_user)
    begin
      payment_methods = Stripe::PaymentMethod.list({
        customer: current_user[:customer_id],
        type: 'card'
      })
      payment_methods[:data]
    rescue Stripe::StripeError => error
      {error: error.message }
    end
  end

  def self.create_new_subscription(current_user, price_id, payment_method_id)
    begin
      subscription = Stripe::Subscription.create({
        customer: current_user[:customer_id],
        items: [{price: price_id}],
        default_payment_method: payment_method_id,
      })
      subscription
    rescue Stripe::StripeError => error
      {error: error.message }
    end
  end
end