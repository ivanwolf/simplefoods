FactoryBot.define do
  factory :product do
    name { Faker::Food.dish }
    price { Faker::Number.between(from: 1000, to: 20000) }
  end
end