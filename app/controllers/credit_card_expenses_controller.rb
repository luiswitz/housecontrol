class CreditCardExpensesController < ApplicationController
  def new
    @credit_card_expense = Expense.new
  end
end
