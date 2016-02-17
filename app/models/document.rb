class Document < ActiveRecord::Base

  paginates_per 5

  mount_uploader :file, FileUploader

  belongs_to :category


  validates :name, :description, :category, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
