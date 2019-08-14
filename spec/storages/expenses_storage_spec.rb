# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpensesStorage do
  subject do
    described_class.new
  end

  let(:create) { subject.create(expense_attr) }

  let(:expense_attr) do
    {
      description: 'some expense description',
      amount: 5.10,
      category: 'some important category',
      due_date: '2019/07/20',
      status: 1
    }
  end

  describe '#create' do
    it 'delegates to the ActiveRecord object' do
      expect(Expense).to receive(:create)
        .with(expense_attr)

      create
    end
  end
end
