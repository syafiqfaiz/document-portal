class Category < ActiveRecord::Base

  include PgSearch
  has_many :documents, dependent: :destroy

  validates :name, :description, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_s
    "#{name}"
  end

end
