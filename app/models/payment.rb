class Payment

  def initialize(subscription)
    user = User.find(subscription[:user_id])
    plan = Plan.find(subscription[:plan_id])

      @amount = plan.price.to_s
      @orderid = subscription[:id]
      @bill_name =  user.name
      @bill_email = user.email
      @bill_mobile = "0126591269"
      @bill_desc = plan.description
      @country = "MY"
      @vcode = Digest::MD5.hexdigest("#{@amount}""#{ENV['merchantID']}""#{@orderid}""#{ENV['vkey']}")
      @currency = "MYR"
      @channel = "maybank2u"
      @langcode = "en"
      @returnurl = "http://localhost:3000/payment_callbacks"
  end

  def set_payment_info
    set_array = [
                  'amount','orderid',
                  'bill_name','bill_email',
                  'bill_mobile','bill_desc',
                  'country','vcode',
                  'currency','channel',
                  'langcode','returnurl'
                ]
    params = ''
    set_array.each do |item|
      var = eval("@#{item}")
      value = "#{item}=#{var}&"
      params.concat(value)
    end
    return params
  end

  def url
    "https://www.onlinepayment.com.my/MOLPay/pay/#{ENV['merchantID']}/?"
  end
end






