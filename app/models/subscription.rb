class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  validates :terms_and_conditions, acceptance: true
  validates :plan, :user, presence: true
end
