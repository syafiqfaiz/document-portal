require 'rails_helper'

RSpec.describe Document, :type => :model do
  describe 'validation' do 
    it 'pass with all params' do
      expect(build(:document)).to be_valid
    end

    it 'fail without name' do
      expect(build(:document, name: nil)).not_to be_valid
    end

    it 'fail without description' do
      expect(build(:document, description: nil)).not_to be_valid
    end

    skip it 'fail without images' do
      expect(build(:document, images: nil)).not_to be_valid
    end

    skip it 'fail without file' do
      expect(build(:document, file: nil)).not_to be_valid
    end

    it 'fail without category' do
      expect(build(:document, category: nil)).not_to be_valid
    end
  end

  describe 'slug' do
    it 'is created' do
      document = create(:document)

      expect(document.slug).not_to be_nil
    end
  end
end
