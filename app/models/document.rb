class Document < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search, against: [:name, :description],
    using: {tsearch: {dictionary: "english"}},
      associated_against: {
        category: [:name]
      }

  paginates_per 5

  mount_uploader :file, FileUploader

  belongs_to :category
  has_many :document_images, dependent: :destroy


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

  def self.text_search(query)
    if query.present?
      search(query)
    else
      all
    end
  end

end

