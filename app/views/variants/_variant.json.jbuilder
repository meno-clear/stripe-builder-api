json.extract! variant, :id, :price_in_cents, :value_type, :product_id, :created_at, :updated_at
json.url variant_url(variant, format: :json)
json.product_name variant.product.name
json.ignore_nil!
json.descriptors variant.variant_descriptor_values do |descriptor|
  json.id descriptor.id
  json.name descriptor.variant_descriptor.name
  json.value descriptor.value
  json.value_type descriptor.variant_descriptor.value_type
  json.boolean_value descriptor.boolean_value
end
