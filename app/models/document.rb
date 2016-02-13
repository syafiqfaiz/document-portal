class Document < ActiveRecord::Base

#waiting for pr to merge
=begin
  belongs_to :category 
=end

  validates :name, :description, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
