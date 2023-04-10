FactoryBot.define do
  factory :payment do
    order { nil }
    customer_id { "MyString" }
    status { "MyString" }
  end
end
