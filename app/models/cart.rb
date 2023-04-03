class Cart < ApplicationRecord
has_many :cart_items, dependent: :destroy

  def price_in_cents
    cart_items.map { |cart_item| cart_item.product_price_in_cents * cart_item.quantity }.sum
  end


  def total
    cart_items.map { |cart_item| cart_item.product_price_in_cents * cart_item.quantity }.sum/100
  end


  def total_items
    cart_items.sum(:quantity)
  end

end
