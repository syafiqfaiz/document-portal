class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  validates :plan, :user, presence: true
end
