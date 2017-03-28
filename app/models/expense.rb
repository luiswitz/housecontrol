class Expense < ApplicationRecord
  belongs_to :credit_card, optional: true
  belongs_to :category
  belongs_to :user

  validates_presence_of :value, :category, :date, :user
  validates :value, numericality: { greater_than: 0 }

  def self.years_range
    Expense.uniq.pluck('extract(year from date)').map(&:to_i)
  end

  ransacker :month do
    Arel.sql('extract(month from date)')
  end

  ransacker :year do
    Arel.sql('extract(year from date)')
  end
end
