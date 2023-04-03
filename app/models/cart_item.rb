class CartItem < ApplicationRecord
belongs_to :market_place_partner, required: false
has_one :order_item, dependent: :destroy
  belongs_to :cart, required: false
  belongs_to :product, required: false
  belongs_to :variant, required: false
  has_one :order_item, dependent: :destroy
end
