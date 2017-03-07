require 'rails_helper'

RSpec.describe Income, type: :model do
  describe "when create" do
    before do
      @income = FactoryGirl.create(:income)
    end

    it "cannot be valid without a description" do
      @income.descritption = nil
      expect(@income).to_not be_valid
    end

    it "cannot be valid without a value" do
      @income.value = nil
      expect(@income).to_not be_valid
    end

    it "cannot be valid without a date" do
      @income.date = nil
      expect(@income).to_not be_valid
    end

    it "cannot be valid when value is less than zero" do
      @income.value = 0.0
      expect(@income).to_not be_valid
    end

    it "cannot be valid without an user" do
      @income.user = nil
      expect(@income).to_not be_valid
    end

  end
end
