class CreditCard < ApplicationRecord
  belongs_to :credit_card_flag
  validates_presence_of :name, :credit_card_flag, :due_date
  validates_inclusion_of :due_date, :in => 1..30
end
