class Plan < ActiveRecord::Base
  def active?
    active == true
  end
end