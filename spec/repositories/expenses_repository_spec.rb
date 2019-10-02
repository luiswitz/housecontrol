# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ExpensesRepository do
  subject do
    described_class.new(storage: storage)
  end

  let(:storage) { double(:storage) }
  let(:create) { subject.create(expense_payload) }

  let(:expense_payload) do
    {
      query_text: 'some expense input',
      parameters: {
        number_integer: '',
        date_time: '2019/08/18',
        installment: '',
        number1: '',
        unit_currency: '',
        number: '10',
        expense_category: 'the-category',
        date_time1: ''
      },
      language_code: 'pt-br'
    }
  end

  let(:expense_hash) do
    {
      description: 'some expense input',
      amount: 10.0,
      category: 'the-category',
      due_date: '2019/08/18',
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
