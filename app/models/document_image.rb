class DocumentImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :document

  validates :image, :document_id, presence: true
end
