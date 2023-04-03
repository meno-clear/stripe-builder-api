json.extract! variant_descriptor, :id, :name, :available_options, :value_type, :created_at, :updated_at
json.url variant_descriptor_url(variant_descriptor, format: :json)
json.descriptor_values variant_descriptor.variant_descriptor_values.map { |descriptor| {
  variant_descriptor_id: variant_descriptor.id,
  value: descriptor.value,
}}.uniq.sort_by { |descriptor| descriptor[:value] }
