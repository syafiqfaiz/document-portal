class ReceiptsController < ApplicationController
  before_action :set_subscription, only: :show

  def show
  end

private
  def set_subscription
    binding.pry
    @subscription = Subscription.find(params[:id])
    @plan = Plan.find_by(id: @subscription.plan_id)
    @page = @subscription.status == "active" ? "Receipt" : "Failed"
  end
end
