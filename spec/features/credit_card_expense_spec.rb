require 'rails_helper'

describe "navigate" do

  describe "new" do
    it "should has a link from the expenses list" do
      visit new_credit_card_expense_path
      expect(page.status_code).to eq(200)
    end
  end

end
