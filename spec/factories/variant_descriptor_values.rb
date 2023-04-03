FactoryBot.define do
  factory :variant_descriptor_value do
    value { "MyString" }
    integer_value { 1 }
    boolean_value { false }
    large_value { "MyText" }
    variant_descriptor { nil }
    variant { nil }
    product { nil }
  end
end
