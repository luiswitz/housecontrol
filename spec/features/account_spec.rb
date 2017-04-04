require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  describe "creation" do
    before do
      visit new_account_path
    end

    it "has a form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in 'account[name]', with: 'My Account'
      fill_in 'account[initial_balance]', with: 1000.00
      expect { click_on 'Adicionar'}.to change(Account, :count).by(1)
    end

  end
end
