FactoryGirl.define do
  factory :document do
    name "MyString"
    description "MyString"
    count 0
    association :category 
  end
end
