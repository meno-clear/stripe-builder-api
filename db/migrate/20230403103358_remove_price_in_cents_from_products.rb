class RemovePriceInCentsFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :price_in_cents, :integer
  end
end
