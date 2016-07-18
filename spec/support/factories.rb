FactoryGirl.define do

  sequence :name do |n|
    "Merchant-#{n}"
  end

  factory :merchant do |n|
    name
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end
end
