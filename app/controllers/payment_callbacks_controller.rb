class PaymentCallbacksController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    @subscription = Subscription.find_by(id: params[:orderid])
    @subscription.update(skey: params[:skey],
                          tranID: params[:tranID],
                          mol_status: params[:status],
                          paydate: get_params[:paydate],
                          status: get_params[:subscription_status],
                          payment_method: params[:channel],
                          amount_paid: get_params[:amount],
                          end_at: get_params[:end_date])

    redirect_to receipt_path(@subscription), flash: {success: get_params[:flash_message]}
  end

  private

  def get_params
    result = {
      end_date: params[:status] == "00" ? DateTime.now + @subscription.plan.duration : nil,
      amount: params[:status] == "00" ? params[:amount] : nil,
      paydate: params[:status] == "00" ? params[:paydate] : nil,
      flash_message: params[:status] == "00" ? "Thank you, you now have unlimited access to all documents." : "Payment rejected",
      subscription_status: params[:status] == "00" ? :active : :rejected
    }
  end

end




