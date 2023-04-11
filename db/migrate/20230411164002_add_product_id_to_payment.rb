class AddProductIdToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :product_id, :string
  end
end
