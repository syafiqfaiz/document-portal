class User < ActiveRecord::Base
  include Clearance::User

  has_many :subscriptions, dependent: :destroy

  def is_admin?
    admin == true
  end

  def has_active_subscription?
    subscriptions.where(end_date = ?, >= DateTime.now.to_s).any?
  end


end
