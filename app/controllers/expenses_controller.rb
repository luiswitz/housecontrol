# frozen_string_literal: true

class ExpensesController < ApplicationController
  def create
    service = AppDependencies.new.get('services.create_expense_service')
    service.create_expense(expense_params.to_h)
  end

  private

  def expense_params
    params.require('queryResult').permit(
      'queryText',
      'languageCode',
      'parameters': %w[
        number-integer
        date-time
        installment
        number-1
        unit-currency
        number
        expense-category
        date-time1
      ]
    )
  end
end
