require 'rails_helper'

describe "navigate" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
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

end
