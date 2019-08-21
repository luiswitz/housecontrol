# frozen_string_literal: true

class ExpensesRepository
  def initialize(storage:)
    @storage = storage
  end

  def create(expense_payload)
    expense = create_entity(expense_payload)

    storage.create(expense.to_h)
  end

  private

  def create_entity(expense)
    ExpenseEntity.new(
      description: expense[:query_text],
      amount: expense[:parameters][:number],
      category: expense[:parameters][:expense_category],
      due_date: expense[:parameters][:date_time],
      status: 0
    )
  end

  # def due_date(date)
  #   unless date.empty?
  #     return date
  #   end
  #
  #   Date.today.to_s
  # end

  attr_reader :storage
end
