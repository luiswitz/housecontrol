# frozen_string_literal: true

require 'nurse'

class AppDependencies < Nurse::DependencyContainer
  def initialize
    super
    add_factory(ExpensesRepositoryFactory.new)
    add_factory(CreateExpenseServiceFactory.new)
  end
end
