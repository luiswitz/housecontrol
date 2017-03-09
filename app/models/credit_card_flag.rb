class CreditCardFlag < ApplicationRecord
  has_many :credit_cards
  validates_presence_of :name
end
