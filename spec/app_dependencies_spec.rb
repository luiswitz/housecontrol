# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppDependencies do
  def self.it_defines(key)
    it "has dependency #{key}" do
      expect(subject.defined?(key)).to be(true)
    end
  end

  it_defines('repositories.expenses_repository')
  it_defines('services.create_expense_service')
end
