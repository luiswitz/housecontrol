class Expense < ApplicationRecord
  belongs_to :credit_card, optional: true
  belongs_to :category
  belongs_to :user

  validates_presence_of :value, :category, :date, :user
  validates :value, numericality: { greater_than: 0 }
end
