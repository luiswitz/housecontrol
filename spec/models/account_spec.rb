require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "when create" do
    before do
      @account = FactoryGirl.create(:account)
    end

    it "cannot be created without a name" do
      @account.name = nil
      expect(@account).to_not be_valid
    end

    it "cannot be created without an user" do
      @account.user = nil
      expect(@account).to_not be_valid
    end
  end
end
