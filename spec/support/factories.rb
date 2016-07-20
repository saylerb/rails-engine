FactoryGirl.define do

  sequence(:merchant_name) { |n| "Merchant name #{n}" }

  factory :merchant do
    name { generate(:merchant_name) }
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end

  factory :customer do
    transient do 
      name nil
    end

    sequence(:first_name) { |i| "First name #{i}" }
    sequence(:last_name) { |i| "Last name #{i}" }

    after(:build) do |instance, evaluator|
      if evaluator.name
        instance.first_name, instance.last_name = evaluator.name.split(' ')    
      end
    end

    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end

  sequence(:item_name) { |n| "Item name #{n}" }
  sequence(:description) { |n| "Description #{n}" }
  sequence(:unit_price) { |n| 10 + n }

  factory :item do
    merchant
    name { generate(:item_name) }
    description
    unit_price
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end

  factory :invoice do
    customer
    merchant
    status "active"
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end

end
