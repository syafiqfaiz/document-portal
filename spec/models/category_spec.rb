require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe 'validation' do
    it ' pass with valid input' do
      expect(build(:category)).to be_valid
    end

    it 'fail without name' do
      expect(build(:category, name: nil)).not_to be_valid
    end

    it 'fail without description' do
      expect(build(:category, description: nil)).not_to be_valid
    end
  end
end
