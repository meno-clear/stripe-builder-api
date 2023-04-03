class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.integer :price_in_cents
      t.boolean :value_type
      t.integer :product_id

      t.timestamps
    end
    add_index :variants, :product_id
  end
end
