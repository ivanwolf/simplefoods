FactoryBot.define do
  factory :workday do
    work_date { Date.today  }

    trait :with_products do
      after :create do |workday|
        workday.workday_products << create(:workday_product)
      end
    end
  end
end