FactoryGirl.define do
  factory :expense do
    description { Faker::Lorem.sentence }
    value { Faker::Number.decimal(Faker::Number.between(2,3), 2) }
    date { Faker::Date.between(90.days.ago, Date.today + 90) }
    credit_card nil
    category { FactoryGirl.create(:category, kind: :expense) }
    payment_date { Faker::Date.between(90.days.ago, Date.today + 90) }
    is_payed { Faker::Boolean.boolean }
    parcel 1
    user { FactoryGirl.create(:user) }
  end
end
