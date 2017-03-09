require 'rails_helper'

RSpec.describe CreditCardFlag, type: :model do
  describe "when create" do
    before do
      @credit_card_flag = FactoryGirl.create(:credit_card_flag)
    end

    it "cannot be valid withot a name" do
      @credit_card_flag.name = nil
      expect(@credit_card_flag).to_not be_valid
    end
  end
end
