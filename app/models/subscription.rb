class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  validates :terms_and_conditions, acceptance: true
  validates :plan, :user, presence: true
  before_save :check_if_user_subscribe


  def check_if_user_subscribe
    if self.status == "active"
      user = self.user
      user.update(subscribe: true)
    end
  end

  # will run whenever user trying to download content
  def check_active_subscription_status
    subscriptions = Subscription.where(status: :active)
    subscriptions.each do |subscribe|
      if DateTime.now >= subscribe.end_at
        subscribe.update(status: :expired)
      end
    end
  end

end