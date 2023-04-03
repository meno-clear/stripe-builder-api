class CreateProductDescriptorValues < ActiveRecord::Migration[7.0]
  def change
    create_table :product_descriptor_values do |t|
      t.string :value
      t.integer :integer_value
      t.boolean :boolean_value
      t.text :large_value
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :product_descriptor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
