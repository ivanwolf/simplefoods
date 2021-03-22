FactoryBot.define do
  factory :phone_number do
    country_code { Faker::PhoneNumber.area_code }
    number { Faker::Number.number(digits: 9) }
  end
end