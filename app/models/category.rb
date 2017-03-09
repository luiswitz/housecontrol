class Category < ApplicationRecord
  enum kind: { income: 0, expense: 1 }
  belongs_to :user
  validates_presence_of :name, :user
end
