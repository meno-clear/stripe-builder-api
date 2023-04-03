class Product < ApplicationRecord
  belongs_to :market_place_partner

  belongs_to :category
  has_many :product_descriptor_values, dependent: :destroy
  has_many :variants
  has_many :variant_descriptor_values

  accepts_nested_attributes_for :product_descriptor_values, allow_destroy: true
end
