require 'rails_helper'

describe "navigate" do
  # let(:user) { FactoryGirl.create(:user) }
  # let(:category) { FactoryGirl.create(:category, name: 'oi', user: user, kind: :income) }

  before do
    @user = FactoryGirl.create(:user)
    @category = FactoryGirl.create(:category, name: 'oi', user: @user, kind: :income)
    login_as(@user)
  end

  describe "index" do
    before do
      visit incomes_path
    end

    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "has a title of Incomes" do
      expect(page).to have_content(/Receitas/)
    end

    it "has a list of Incomes" do
      income1 = FactoryGirl.create(:income)
      income2 = FactoryGirl.create(:income)
      visit incomes_path
      expect(page).to have_content(/Income|description/)
    end
  end

  describe "new" do
    it "has a link from the incomes list" do
      visit incomes_path
      click_link "Nova"
      expect(page.status_code).to eq(200)
    end
  end

  describe "creation" do
    before do
      visit new_income_path
    end

    it "has a form that can be reached" do
      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      fill_in 'income[description]', with: 'Some Income'
      fill_in 'income[value]', with: 99.9
      fill_in 'income[date]', with: Date.today
      select "#{@category.name}", :from => "income[category_id]"
      expect { click_on 'Adicionar'}.to change(Income, :count).by(1)
    end

  end
end
