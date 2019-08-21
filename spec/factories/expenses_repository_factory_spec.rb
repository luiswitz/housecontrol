# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ExpensesRepositoryFactory do
  let(:expected_key) { 'repositories.expenses_repository' }
  let(:storage) do
    ExpensesStorage.new
  end

  let(:container) do
    instance_double(AppDependencies)
  end

  let(:create_service) do
    subject.create_service(container)
  end

  it 'defines a key' do
    expect(subject.dependency_key).to eq(expected_key)
  end

  it 'is shared' do
    expect(subject.shared?).to eq(true)
  end

  describe '#create_service' do
    let(:expected_service) do
      ExpensesRepository.new(storage: storage)
    end

    it 'returns an expense repository instance' do
      expect(create_service).to be_equal_to(expected_service)
    end
  end
end
