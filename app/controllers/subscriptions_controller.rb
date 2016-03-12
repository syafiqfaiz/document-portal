class SubscriptionsController < ApplicationController
  before_action :require_login
  before_action :set_subscription, only: :update

  def create
    @subscription = current_user.subscriptions.find_or_create_by(status: 'new', plan_id: params[:plan])
  end

  def update
    @subscription.update(terms_and_conditions: params[:subscription][:terms_and_conditions], status: "pending")
    payment = Payment.new(@subscription)
    payment_info = payment.set_payment_info
    redirect_to "#{payment.url}#{payment_info}"
  end

  private
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end
end

=begin
new subscription=> subscription is created, with status: new, user_id
create subscription=> must accept terms and conditions, status: pending
redirect to payment


>>>>> in payment callback controller >>>>>
if payment succes
  status: active
  redirect to index
else
  status: rejected
  redirect to new subscription page, with flash, payment rejected
end


subscription status
  new
  pending
  active
  rejected
  expired

=end
