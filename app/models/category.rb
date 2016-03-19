class Category < ActiveRecord::Base

  include PgSearch
  has_many :documents, dependent: :destroy

  validates :name, :description, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def top_5_documents
    documents.order(count: :desc).first(5)
  end

  def to_s
    "#{name}"
  end

end
