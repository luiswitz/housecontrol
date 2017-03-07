class Income < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates_presence_of :descritption, :value, :date
  validates :value, numericality: { greater_than: 0 }
end
