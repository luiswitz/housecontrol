FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name 'John'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
