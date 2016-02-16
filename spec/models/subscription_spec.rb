require 'rails_helper'

RSpec.describe Subscription, :type => :model do
  describe 'validation' do
    it "pass with all valid attributes" do
      expect(build(:subscription)).to be_valid
    end

    skip it "fail without necessary attributes" do
    end
  end
end
