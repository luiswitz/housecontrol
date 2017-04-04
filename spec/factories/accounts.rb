FactoryGirl.define do
  factory :account do
    name "My account"
    initial_balance "100.00"
    user { FactoryGirl.create(:user) }
  end
end
