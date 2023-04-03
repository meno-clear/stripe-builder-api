FactoryBot.define do
  factory :variant do
    price_in_cents { 1 }
    value_type { false }
    product_id { 1 }
  end
end
