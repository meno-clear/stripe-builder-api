class RemovePaymentIntentIdFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :payment_intent_id, :string
  end
end
