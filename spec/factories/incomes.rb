FactoryGirl.define do
  factory :income do
    descritption "Income"
    value 9.99
    date Date.today
    category { FactoryGirl.create(:category) }
    received true
    user { FactoryGirl.create(:user) }
  end
end
