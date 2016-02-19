class Document < ActiveRecord::Base

  paginates_per 5

  mount_uploader :file, FileUploader

  belongs_to :category


  validates :name, :description, :category, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def category_name
    "#{category.name}"
  end

  def count_increment
    self.count += 1
    self.save
  end
end
