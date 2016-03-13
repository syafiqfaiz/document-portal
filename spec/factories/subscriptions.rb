FactoryGirl.define do
  factory :subscription do
    association :user
    association :plan
    amount_paid 100.00
    status "paid"
    payment_method "Payment gateway1"
    tranID "123123-fe-rss11123123"
    paydate "2016-02-16 15:56:22"
    end_at "2016-03-16 15:56:22"
  end
end