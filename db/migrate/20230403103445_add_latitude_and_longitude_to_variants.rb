class AddLatitudeAndLongitudeToVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :latitude, :float
    add_column :variants, :longitude, :float
  end
end
