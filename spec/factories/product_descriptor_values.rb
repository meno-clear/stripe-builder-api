FactoryBot.define do
  factory :product_descriptor_value do
    value { "MyString" }
    integer_value { 1 }
    boolean_value { false }
    large_value { "MyText" }
    product { nil }
    product_descriptor { nil }
  end
end
