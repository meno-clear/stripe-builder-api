class CreateProductDescriptors < ActiveRecord::Migration[7.0]
  def change
    create_table :product_descriptors do |t|
      t.string :name
      t.text :available_options

      t.timestamps
    end
  end
end
