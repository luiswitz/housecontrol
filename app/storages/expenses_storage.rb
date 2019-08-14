# frozen_string_literal: true

class ExpensesStorage
  def create(expense_attr)
    Expense.create(expense_attr)
  end
end
