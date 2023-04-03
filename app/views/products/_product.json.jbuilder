json.extract! product, :id, :name, :created_at, :updated_at, :category_id
json.market_place_name product.market_place_partner.name
json.url product_url(product, format: :json)
json.ignore_nil!
json.descriptors product.product_descriptor_values do |descriptor|
  json.id descriptor.id
  json.descriptor_id descriptor.product_descriptor.id
  json.name descriptor.product_descriptor.name
  json.value descriptor.value
end
json.variants product.variants do |variant|
  json.id variant.id
  json.product_id variant.product_id
  json.price_in_cents variant.price_in_cents
  json.descriptors variant.variant_descriptor_values do |descriptor|
    json.name descriptor.variant_descriptor.name
    json.value descriptor.value
    json.boolean_value descriptor.boolean_value
    json.value_type descriptor.variant_descriptor.value_type
  end
end
