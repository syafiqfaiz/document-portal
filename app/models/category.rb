class Category < ActiveRecord::Base
  validates :name, :description, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
