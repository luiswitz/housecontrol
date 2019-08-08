# frozen_string_literal: true

PROJECT_ROOT = File.expand_path('../../', __FILE__)

$LOAD_PATH.unshift(PROJECT_ROOT) unless $LOAD_PATH.include?(PROJECT_ROOT)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

# Entities
require 'app/entities/base'
require 'app/entities/expense_entity'

# Repositories
require 'app/repositories/expense_repository'

# Services
require 'app/services/create_expense_service'

# Storages
require 'app/storages/expenses_storage'
