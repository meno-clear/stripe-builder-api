class Payment < ApplicationRecord
  has_many :orders

  def checkout
    payment_intent = Stripe::PaymentIntent.retrieve(self.payment_intent_id)
    ephemeralKey = Stripe::EphemeralKey.create({
      customer: self[:customer_id]
    }, {stripe_version: '2020-08-27'})
    return { 
      payment_intent: payment_intent, 
      ephemeralKey: ephemeralKey[:secret], 
      customer_id:  self[:customer_id], 
      payment_id: self[:id] 
    }
  end
end
