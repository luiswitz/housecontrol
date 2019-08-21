# frozen_string_literal: true

class ExpenseEntity < Entities::Base
  attributes initializer: true do
    attribute :description, :string
    attribute :amount, :float
    attribute :category, :string
    attribute :due_date, :any, lambda { |adapter|
      adapter.with_nil_value
      adapter.with_default_value(Date.today.to_s)
    }
    attribute :status, :integer
  end
end
