FactoryGirl.define do
  factory :parcel do
    paid false
    number 1
    value "9.99"
    due_date "2017-04-05"
    expense nil
  end
end
