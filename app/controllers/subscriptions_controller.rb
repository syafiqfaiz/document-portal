class SubscriptionsController < ApplicationController
  before_action :require_login

  def create
    @subscription = Subscription.create(user: current_user, plan_id: params[:plan], status: "new")
  end

  def update
    @subscription.update(terms_and_conditions: params[:subscription][:terms_and_conditions], status: "pending")
    payment = Payment.new(@subscription)
    redirect_to payment.url
  end
end

=begin
new subscription=> subscription is created, with status: new, user_id
create subscription=> must accept terms and conditions, status: pending
redirect to payment

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
  expired

    
=end
