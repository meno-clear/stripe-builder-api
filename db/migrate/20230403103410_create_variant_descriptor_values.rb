class CreateVariantDescriptorValues < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_descriptor_values do |t|
      t.string :value
      t.integer :integer_value
      t.boolean :boolean_value
      t.text :large_value
      t.references :variant_descriptor, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
