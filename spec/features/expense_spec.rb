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
      expect(page).to have_content(/#{expense1.description}|#{expense2.description}/)
    end
  end

  describe "#search" do
    before do
      FactoryGirl.create(:expense, date: Date.new(2017,1,19), user: @user)
      FactoryGirl.create(:expense, date: Date.new(2016,2,20), user: @user)
      FactoryGirl.create(:expense, date: Date.new(2015,3,21), user: @user)
      visit expenses_path
    end

    it "should have 3 years in select year filter" do
      list = Array.new
      list = find('#q_year_eq').all('option')

      expect(list.size).to eq(3)
    end

    it "shows only January 2017 records" do
      find('#q_year_eq').select('2017')
      find('#q_month_eq_1', visible: false).click
      find('#refresh-search', visible: false).click

      page.assert_selector('.table tbody tr', count: 1)
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
