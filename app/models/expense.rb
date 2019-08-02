class Expense < ApplicationRecord
  validates :description, presence: true
  validates :amount, presence: true

  validates_numericality_of :amount, greater_than: 0
end
