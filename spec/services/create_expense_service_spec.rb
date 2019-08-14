# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CreateExpenseService do
  subject do
    described_class.new(repository: repository)
  end

  let(:repository) { double(:repository) }

  let(:expense_params) do
    {
      "queryText": 'some expense input',
      "parameters": {
        "number-integer": '',
        "date-time": '',
        "installment": '',
        "number1": '',
        "unit-currency": '',
        "number": '',
        "expense-category": '',
        "date-time1": ''
      },
      "languageCode": 'pt-br'
    }
  end

  let(:create_expense) { subject.create_expense(expense_params) }

  describe '#create_expense' do
    context 'when it is a single expense' do
      it 'creates a single expense' do
        expect(repository).to receive(:create)
          .with(expense_params)

        create_expense
      end
    end

    context 'when it is an installment' do
      let(:expense_params) do
        {
          "queryText": 'some expense input',
          "parameters": {
            "number-integer": '',
            "date-time": '',
            "installment": '10 vezes',
            "number1": '',
            "unit-currency": '',
            "number": '',
            "expense-category": '',
            "date-time1": ''
          },
          "languageCode": 'pt-br'
        }
      end

      it 'creates the number of installment expenses' do
        expect(repository).to receive(:create)
          .with(expense_params).exactly(10).times

        create_expense
      end
    end
  end
end
