require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  def index
    before do
      visit accounts_path
    end

    it "has a Contas title" do
      expect(page).to have(/Contas/)
    end

    it "has a accounts list" do
      account1 = FactoryGirl.create(:account, user: @user)
      account2 = FactoryGirl.create(:account, user: @user)
      visit accounts_path
      expect(page).to have_content(/#{account1.name}|#{account2.name}/)
    end
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
