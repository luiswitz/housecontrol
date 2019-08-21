# frozen_string_literal: true

class CreateExpenseServiceFactory < ServiceFactory
  key 'services.create_expense_service'

  def create_service(container)
    repository = container.get('repositories.expenses_repository')
    CreateExpenseService.new(repository: repository)
  end
end
