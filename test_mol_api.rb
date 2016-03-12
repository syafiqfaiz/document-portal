user state =
=begin
subscription status
  new
  pending
  active
  rejected
  expired

=end



url = "https://www.onlinepayment.com.my/MOLPay/pay/MerchantID/Payment_Method"
url = "https://www.onlinepayment.com.my/MOLPay/pay/merchantID/"

channel = credit, fpx, maybank2u, cimb, rhb


# to be sent to mol
param = {

mandatory
  amount = "E.g. 500, 168.99"
  orderid = "E.g. BH2018­09rev"
  bill_name =  "Buyer full name"
  bill_email = "Buyer email"
  bill_mobile = "Buyer contact number"
  bill_desc = "description of item user buy"
  country = "Eg. MY"

optional
  vcode = md5(amount & merchantID & orderid & verify key )
  currency = "MYR"
  channel = "maybank2u etc"
  langcode = "en"
  returnurl = "http://localhost:3000/payment_callback"

}



# being return from mol
result = {
  amount = "E.g. 500, 168.99"
  orderid = "E.g. BH2018­09rev"
  tranID = "Unique transaction ID for tracking purpose."
  domain = "Merchant ID in MOLPay system"
  status = "00 for Successful payment, 11 for failure."
  error_code = ""
  error_desc =
  skey = "This is the data integrity protection hash
          string. Refer skey section for details."
  currency = "MYR"
  channel = "maybank2u etc"
  paydate = "Date/Time of the transaction."
}



