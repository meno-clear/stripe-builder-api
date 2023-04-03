json.extract! order_item, :id, :quantity, :price_in_cents, :order_id, :cart_item_id, :created_at, :updated_at
json.cart_item order_item.cart_item
json.variant_descriptors order_item.cart_item.variant.variant_descriptor_values.map { |descriptor| {
  name: descriptor.variant_descriptor.name,
  value: descriptor.value,
  boolean_value: descriptor.boolean_value,
  value_type: descriptor.variant_descriptor.value_type
}}
json.url order_item_url(order_item, format: :json)
