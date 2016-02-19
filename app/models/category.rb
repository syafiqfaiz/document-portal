class Category < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :documents, dependent: :destroy


  extend FriendlyId
  friendly_id :name, use: :slugged

  def to_s
    "#{name}"
  end

end
