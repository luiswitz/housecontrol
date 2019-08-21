# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CreateExpenseServiceFactory do
  let(:expected_key) { 'services.create_expense_service' }
  let(:shared) { true }

  let(:container) do
    instance_double(AppDependencies)
  end

  let(:expected_service) do
    CreateExpenseService.new(repository: repository)
  end

  let(:repository_key) { 'repositories.expenses_repository' }
  let(:repository) { double(:repository) }

  before do
    allow(container).to receive(:get)
      .with(repository_key)
      .and_return(repository)
  end

  describe '#key' do
    it 'returns the expected key' do
      expect(subject.dependency_key).to eq(expected_key)
    end
  end

  describe '#create_service' do
    it 'returns the expected service' do
      expect(subject.create_service(container)).to be_equal_to(expected_service)
    end
  end
end
