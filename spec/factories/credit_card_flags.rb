FactoryGirl.define do
  sequence :name do |n|
    "Flag #{n}"
  end

  factory :credit_card_flag do
    name { generate :name }
  end
end
