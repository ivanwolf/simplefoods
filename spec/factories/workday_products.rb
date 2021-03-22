FactoryBot.define do
  factory :workday_product do
    product
    workday
    stock { Faker::Number.between(from: 1, to: 30) }
    delivery_time { Time.zone.now }
  end
end