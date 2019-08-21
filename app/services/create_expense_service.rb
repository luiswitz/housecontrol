# frozen_string_literal: true

class CreateExpenseService
  def initialize(repository:)
    @repository = repository
  end

  def create_expense(expense_params)
    params = hash_utils.deep_symbolize(expense_params)

    unless installment?(params)
      create_installment_expense(params)
      return
    end

    repository.create(params)
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

  def hash_utils
    HashUtils::KeySymbolizer.new
  end

  attr_reader :repository
end
