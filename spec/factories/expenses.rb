# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    description { 'MyString' }
    amount { '9.99' }
    category { 'MyString' }
    due_date { '2019-08-02' }
    status { 1 }
  end
end
