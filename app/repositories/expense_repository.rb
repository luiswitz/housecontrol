module Repositories
  class ExpenseRepository
    def initialize(storage:)
      @storage = storage
    end

    def create(expense_payload)
      expense = create_entity(expense_payload)

      storage.create(expense.to_h)
    end

    private

    def create_entity(expense)
      Entities::Expense.new(
        description: expense[:queryText],
        amount: expense[:parameters][:number],
        category: expense[:parameters][:'expense-category'],
        due_date: expense[:parameters][:'date-time'],
        status: 0
      )
    end

    attr_reader :storage
  end
end
