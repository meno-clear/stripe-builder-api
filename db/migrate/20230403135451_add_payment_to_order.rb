class AddPaymentToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :payment, foreign_key: true
  end
end
