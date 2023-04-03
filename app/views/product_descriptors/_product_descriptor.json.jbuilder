json.extract! product_descriptor, :id, :name, :available_options, :created_at, :updated_at
json.url product_descriptor_url(product_descriptor, format: :json)
json.descriptor_values product_descriptor.product_descriptor_values.map { |descriptor| {
  product_descriptor_id: product_descriptor.id,
  value: descriptor.value,
}}.uniq.sort_by { |descriptor| descriptor[:value] }
