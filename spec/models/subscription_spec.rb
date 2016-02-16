require 'rails_helper'

RSpec.describe Subscription, :type => :model do
  describe 'validation' do
    it "pass with all valid attributes" do
      expect(build(:subscription)).to be_valid
    end

    it "fail without user" do
      subscription = build(:subscription, user: nil)
      expect(subscription).not_to be_valid
    end

    it "fail without plan" do
      subscription = build(:subscription, plan: nil)
      expect(subscription).not_to be_valid
    end
    it "fail without status" do
      subscription = build(:subscription, status: nil)
      expect(subscription).not_to be_valid
    end
  end
end
