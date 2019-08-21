# frozen_string_literal: true

class ExpensesRepositoryFactory < ServiceFactory
  key 'repositories.expenses_repository'
  share true

  def create_service(_container)
    storage = ExpensesStorage.new
    ExpensesRepository.new(storage: storage)
  end
end
