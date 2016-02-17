class PaymentCallbacksController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    #pending on API
    @subscription = Subscription.find_by(id: params[:id])
    # if success 
    @subscription.update(status: 'active', payment_id: 1234, paid_at: DateTime.now, end_at: end_date)
    redirect_to root_path, notice: "Thank you, you now have unlimited access to all documents."
    # else
      #@subscription.update(status: 'rejected')
      # redirect_to plans_path, alert: "Payment rejected"
    # end
  end

  private

  def end_date
    duration = @subscription.plan.duration
    DateTime.now + duration.months
  end
end