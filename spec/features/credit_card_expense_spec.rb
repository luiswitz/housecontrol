require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category, name: 'oi', user: @user, kind: :expense)
    @credit_card = FactoryGirl.create(:credit_card, user: @user)
    login_as(@user)
  end

  describe "new" do
    xit "should has a link from the expenses list" do
      visit new_credit_card_expense_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "create" do
    before do
      visit new_credit_card_expense_path
    end

    xit "can be created from new form page" do
      fill_in 'expense[description]', with: 'Some credit card expense'
      fill_in 'expense[value]', with: 9.99
      fill_in 'expense[date]', with: Date.today
      select "#{@category.name}", :from => "expense[category_id]"
      select "#{@credit_card.name}", :from => "expense[credit_card_id]"
      expect { click_on 'Adicionar'}.to change(Expense, :count).by(1)
    end
  end

end
