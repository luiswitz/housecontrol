# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ExpenseEntity do
  let(:due_date) { '2019/08/18' }

  subject do
    described_class.new(
      description: 'the-description',
      amount: 10.0,
      category: 'the-category',
      due_date: due_date,
      status: 1
    )
  end

  it 'has a description' do
    expect(subject.description).to eq('the-description')
  end

  it 'has an amount' do
    expect(subject.amount).to eq(10.0)
  end

  it 'has a category' do
    expect(subject.category).to eq('the-category')
  end

  context 'when due_date is empty' do
    let(:due_date) { '' }

    it 'returns today as default' do
      expect(subject.due_date).to eq(Date.today)
    end
  end

  context 'when it has a valid due_date' do
    it 'returns the due_date value' do
      expect(subject.due_date).to eq(Date.parse('2019/08/18'))
    end
  end

  it 'has a status' do
    expect(subject.status).to eq(1)
  end
end
