class SubscriptionsController < ApplicationController
  before_action :require_login
  before_action :set_subscription, only: :update

  def create
    @subscription = current_user.subscriptions.find_or_create_by(status: :new, plan_id: params[:plan])
  end

  def update
    @subscription.update(terms_and_conditions: params[:subscription][:terms_and_conditions], status: :pending)
    payment = Payment.new(@subscription)
    payment_info = payment.set_payment_info
    redirect_to "#{payment.url}#{payment_info}"
  end

  private
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end
end

