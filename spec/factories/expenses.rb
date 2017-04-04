FactoryGirl.define do
  factory :expense do
    description { Faker::Lorem.sentence }
    value { Faker::Number.decimal(Faker::Number.between(2,3), 2) }
    expensed_at { Faker::Date.between(90.days.ago, Date.today + 90) }
    credit_card nil
    category { FactoryGirl.create(:category, kind: :expense) }
    paid_at { Faker::Date.between(90.days.ago, Date.today + 90) }
    status { rand Expense.statuses.size }
    parcel 1
    user { FactoryGirl.create(:user) }
  end
end
