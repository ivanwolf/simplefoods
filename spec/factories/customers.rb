FactoryBot.define do
  factory :customer do
    name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    apartment { Faker::Number.number(digits: 3) }
    address { Faker::Address.street_address }
  end
end