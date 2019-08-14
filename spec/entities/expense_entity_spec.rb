# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ExpenseEntity do
  subject do
    described_class.new(
      description: 'the-description',
      amount: 10.0,
      category: 'the-category',
      due_date: '2019/08/19',
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

  it 'has a due_date' do
    expect(subject.due_date).to eq(Date.parse('2019/08/19'))
  end

  it 'has a status' do
    expect(subject.status).to eq(1)
  end
end
