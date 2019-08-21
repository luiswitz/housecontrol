# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe '#create' do
    let(:payload) do
      {
        'queryResult' => {
          'queryText' => 'some expense input',
          'parameters' => {
            'number-integer' => '',
            'date-time' => '',
            'installment' => '',
            'number-1' => '',
            'unit-currency' => '',
            'number' => '',
            'expense-category' => '',
            'date-time1' => ''
          },
          'languageCode' => 'pt-br'
        }
      }
    end

    let(:service) { double(:service) }
    let(:dependencies) { double(:dependencies) }

    before do
      allow(AppDependencies).to receive(:new).and_return(dependencies)
      allow(dependencies).to receive(:get)
        .with('services.create_expense_service')
        .and_return(service)
    end

    it 'delegates to the correct service' do
      expect(service).to receive(:create_expense)
        .with(payload['queryResult'])

      post :create, params: payload
    end
  end
end
