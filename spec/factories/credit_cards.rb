FactoryGirl.define do
  factory :credit_card do
    name "Credit Card"
    credit_card_flag { FactoryGirl.create(:credit_card_flag) }
    due_date { rand 1..20 }
  end
end
