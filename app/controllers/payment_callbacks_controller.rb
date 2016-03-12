class PaymentCallbacksController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    if params[:status] == "00"
      @subscription = Subscription.find_by(id: params[:orderid])
      @subscription.update(skey: params[:skey],
                          tranID: params[:tranID],
                          mol_status: params[:status],
                          paydate: params[:paydate],
                          status: 'active',
                          paid_at: DateTime.now,
                          payment_method: params[:channel],
                          amount_paid: params[:amount],
                          payment_id: params[:tranID],
                          end_at: end_date)

      flash.now[:success] = "Thank you, you now have unlimited access to all documents."
      redirect_to root_path
    else
      flash[:alert] = "Payment rejected"
      redirect_to plans_path
    end

  end

  private

  def end_date
    duration = @subscription.plan.duration
    DateTime.now + duration.months
  end
end