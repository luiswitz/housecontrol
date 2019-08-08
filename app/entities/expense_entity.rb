# frozen_string_literal: true

module Entities
  class Expense < Entities::Base
    attributes initializer: true do
      attribute :description, :string
      attribute :amount, :float
      attribute :category, :string
      attribute :due_date, :date
      attribute :status, :integer
    end
  end
end
