class Expense < ApplicationRecord
  belongs_to :credit_card, optional: true
  belongs_to :category
  belongs_to :user
end
