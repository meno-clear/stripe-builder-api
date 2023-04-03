class Variant < ApplicationRecord
  belongs_to :product, required: false
  has_many :variant_descriptor_values, dependent: :destroy
  has_one :market_place_partner, through: :product
  before_save :load_coordinates

  accepts_nested_attributes_for :variant_descriptor_values, allow_destroy: true

  def load_coordinates
    self.latitude = self.market_place_partner.addresses.first.latitude
    self.longitude = self.market_place_partner.addresses.first.longitude
  end
end
