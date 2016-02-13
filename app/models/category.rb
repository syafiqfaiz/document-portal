class Category < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :documents

  extend FriendlyId
  friendly_id :name, use: :slugged

end
