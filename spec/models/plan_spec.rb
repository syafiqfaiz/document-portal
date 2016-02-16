require 'rails_helper'

RSpec.describe Plan, :type => :model do
  describe 'validation' do
    it 'pass with valid attributes' do
      expect(build(:plan)).to be_valid
    end
  end
end