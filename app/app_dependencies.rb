require 'nurse'

class AppDependencies < Nurse::DependencyContainer
  def initialize
    super
    add_factory(ExpensesRepositoryFactory.new)
  end
end
