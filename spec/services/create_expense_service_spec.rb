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
        "installment": installment,
        "number1": '',
        "unit-currency": '',
        "number": '',
        "expense-category": '',
        "date-time1": ''
      },
      "languageCode": 'pt-br'
    }
  end

  let(:symbolized_params) do
    {
      query_text: 'some expense input',
      parameters: {
        number_integer: '',
        date_time: '',
        installment: installment,
        number1: '',
        unit_currency: '',
        number: '',
        expense_category: '',
        date_time1: ''
      },
      language_code: 'pt-br'
    }
  end

  let(:create_expense) { subject.create_expense(expense_params) }

  describe '#create_expense' do
    context 'when it is a single expense' do
      let(:installment) { '' }

      it 'creates a single expense' do
        expect(repository).to receive(:create)
          .with(symbolized_params)

        create_expense
      end
    end

    context 'when it is an installment' do
      let(:installment) { '10 vezes' }

      it 'creates the number of installment expenses' do
        expect(repository).to receive(:create)
          .with(symbolized_params).exactly(10).times

        create_expense
      end
    end
  end
end
