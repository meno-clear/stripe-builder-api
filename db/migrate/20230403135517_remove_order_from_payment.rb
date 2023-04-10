class RemoveOrderFromPayment < ActiveRecord::Migration[7.0]
  def change
    remove_reference :payments, :order, null: false, foreign_key: true
  end
end
