require 'spec_helper'

RSpec.describe ExpenseRepository do
  subject do
    described_class.new(storage: storage)
  end
  
  let(:storage) { double(:storage) }
  let(:create) { subject.create(expense_payload) }

  let(:expense_payload) do
    {
      "queryText": 'some expense input',
      "parameters": {
        "number-integer": '',
        "date-time": '2019/08/18',
        "installment": '',
        "number1": '',
        "unit-currency": '',
        "number": '10',
        "expense-category": 'the-category',
        "date-time1": ''
      },
      "languageCode": 'pt-br'
    }
  end

  let(:expense_hash) do
    {
      description: 'some expense input',
      amount: 10.0,
      category: 'the-category',
      due_date: Date.parse('2019/08/18'),
      status: 0
    }
  end

  describe '#create' do
    it 'delegates to storage' do
      expect(storage).to receive(:create)
        .with(expense_hash)

      create
    end
  end
end
