class Expense < ApplicationRecord
  enum form_of_payment: [:money, :credit_card]
  enum status: [:paid, :not_paid]

  belongs_to :credit_card, optional: true
  belongs_to :category
  belongs_to :user

  validates_presence_of :value, :category, :expensed_at, :user
  validates :value, numericality: { greater_than: 0 }

  def self.years_range
    Expense.distinct.pluck('extract(year from expensed_at)').map(&:to_i)
  end

  ransacker :month do
    Arel.sql('extract(month from expensed_at)')
  end

  ransacker :year do
    Arel.sql('extract(year from expensed_at)')
  end
end
