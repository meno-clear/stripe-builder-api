class AddVariantRelationToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :variant, null: false, foreign_key: true
  end
end
