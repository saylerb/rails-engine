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

    sequence(:first_name) { |n| "First name #{n}" }
    sequence(:last_name) { |n| "Last name #{n}" }

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

  sequence(:quantity) { |n| n }

  factory :invoice_item do
    invoice
    item
    quantity
    unit_price
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end

end
