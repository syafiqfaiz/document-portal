class Document < ActiveRecord::Base

  belongs_to :category 


  validates :name, :description, :category, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
