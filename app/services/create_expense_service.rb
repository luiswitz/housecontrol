# frozen_string_literal: true

module Services
  class CreateExpenseService
    def initialize(repository:)
      @repository = repository
    end

    def create_expense(expense_params)
      unless installment?(expense_params)
        create_installment_expense(expense_params)
        return
      end

      repository.create(expense_params)
    end

    private

    def installment?(expense_params)
      expense_params[:parameters][:installment].empty?
    end

    def installment_times(expense_params)
      times = expense_params[:parameters][:installment].match(/\d+/)
      if times
        return times[0].to_i
      end
      return 1
    end

    def create_installment_expense(expense_params)
      installment_times(expense_params).times do
        repository.create(expense_params)
      end
    end

    attr_reader :repository
  end
end
