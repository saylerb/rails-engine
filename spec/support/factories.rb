FactoryGirl.define do

  sequence :name do |n|
    "Merchant-#{n}"
  end

  factory :merchant do |n|
    name
  end
end
