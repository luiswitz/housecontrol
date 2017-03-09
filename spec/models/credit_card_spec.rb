require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe "when create" do
    before do
      @credit_card = FactoryGirl.create(:credit_card)
    end

    it "cannot be valid without a name" do
      @credit_card.name = nil
      expect(@credit_card).to_not be_valid
    end

    it "cannot be valid without a credit card flag" do
      @credit_card.credit_card_flag = nil
      expect(@credit_card).to_not be_valid
    end

    it "cannot be valid without a credit due date" do
      @credit_card.due_date = nil
      expect(@credit_card).to_not be_valid
    end

    it "cannot be valid when due date is not between 1 and 30" do
      @credit_card.due_date = 40
      expect(@credit_card).to_not be_valid
    end
  end
end
