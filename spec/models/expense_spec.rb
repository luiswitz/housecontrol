require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "when create a simple expense" do
    before do
      @expense = FactoryGirl.create(:expense)
    end

    it "cannot be valid without a value" do
      @expense.value = nil
      expect(@expense).to_not be_valid
    end

    it "cannot be valid without a category" do
      @expense.category = nil
      expect(@expense).to_not be_valid
    end

    it "cannot be valid without a date" do
      @expense.date = nil
      expect(@expense).to_not be_valid
    end

    it "cannot be valid with value less or equal 0" do
      @expense.value = 0.0
      expect(@expense).to_not be_valid
    end

    it "cannot be valid without an user" do
      @expense.user = nil
      expect(@expense).to_not be_valid
    end
  end
end
