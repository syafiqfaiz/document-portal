class Plan < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy
  
  def active?
    active == true
  end
end