# frozen_string_literal: true

module Storages
  class ExpensesStorage
    def create(expense_attr)
      Expense.create(expense_attr)
    end
  end
end
