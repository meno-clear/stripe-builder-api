json.checkout @payment.checkout
json.orders @payment.orders.map {|order| {
  id: order.id,
  market_place_partner_name: order.market_place_partner.name,
  total: order.total,
  total_items: order.total_items,
  price_in_cents: order.price_in_cents,
  order_items: order.order_items.map {|order_item| {
    id: order_item.id,
    quantity: order_item.quantity,
    price_in_cents: order_item.price_in_cents,
    product_name: order_item.cart_item.product_name,
    variant_descriptors: order_item.cart_item.variant.variant_descriptor_values.map { |descriptor| {
      name: descriptor.variant_descriptor.name,
      value: descriptor.value,
      boolean_value: descriptor.boolean_value,
      value_type: descriptor.variant_descriptor.value_type
    }}
  }
}}
}.sort_by {|order| order[:market_place_partner_name]}
