FactoryGirl.define do
  factory :expense do
    description "Normal Expense"
    value 30.99
    date Date.today
    credit_card nil
    category { FactoryGirl.create(:category, kind: :expense) }
    payment_date Date.today + 30
    is_payed false
    parcel 1
    user { FactoryGirl.create(:user) }
  end
end
