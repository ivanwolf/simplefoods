FactoryBot.define do
  factory :order_product do
    order
    workday_product
    quantity { Faker::Number.between(from: 1, to: 5) }
  end
end