class CreateVariantDescriptors < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_descriptors do |t|
      t.string :name
      t.text :available_options
      t.string :value_type

      t.timestamps
    end
  end
end
