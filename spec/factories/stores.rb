FactoryBot.define do
  factory :store do
    name { Faker::Company.name  }
    slug  { Faker::Alphanumeric.alpha(number: 8)  }
    email { Faker::Internet.email }
    phone_number
  end
end