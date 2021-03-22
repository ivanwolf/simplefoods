FactoryBot.define do
  factory :workday_product do
    name { Faker::Food.dish }
    price { Faker::Number.between(from: 1000 to: 20000) }
    product
    workday
  end
end