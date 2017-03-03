require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "when create" do
    before do
      @category = FactoryGirl.create(:category)
    end

    it "cannot be created without a description and an user" do
      @category.name = nil
      @category.user = nil
      expect(@category).to_not be_valid
    end
  end
end
