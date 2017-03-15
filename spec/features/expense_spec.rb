require 'rails_helper'

describe "navigate" do
  before do
    @user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category, name: 'oi', user: @user, kind: :expense)
    login_as(@user)
  end

  describe "index" do
    before do
      visit expenses_path
    end

    it "should be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "should has a title of Expenses" do
      expect(page).to have_content(/Despesas/)
    end

    it "has a list of Expenses" do
      expense1 = FactoryGirl.create(:expense, user: @user)
      expense2 = FactoryGirl.create(:expense, user: @user)
      visit expenses_path
      expect(page).to have_content(/Normal|expense/)
    end
  end

  describe "new" do
    it "should has a link from the expenses list" do
      visit expenses_path
      click_link "Nova"
      expect(page.status_code).to eq(200)
    end
  end

  describe "create" do
    before do
      visit new_expense_path
    end

    it "has a form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in 'expense[description]', with: 'Some expense'
      fill_in 'expense[value]', with: 9.99
      fill_in 'expense[date]', with: Date.today
      select "#{@category.name}", :from => "expense[category_id]"
      expect { click_on 'Adicionar'}.to change(Expense, :count).by(1)
    end
  end
end
