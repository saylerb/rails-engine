FactoryGirl.define do

  sequence(:merchant_name) { |n| "Merchant name #{n}" }

  factory :merchant do
    name { generate(:merchant_name) }
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'

    factory :merchant_with_items do
      transient do
        item_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.item_count, merchant: merchant)
      end
    end

    factory :merchant_with_invoices do
      transient do
        invoice_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice_with_invoice_items, evaluator.invoice_count, merchant: merchant)
      end
    end
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

    factory :customer_with_invoices_and_transactions do
      transient do
        invoice_count 3
      end

      after(:create) do |customer, evaluator|
        create_list(:invoice_with_transactions, evaluator.invoice_count, customer: customer)
      end
    end
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

    factory :item_with_invoice_items do
      transient do
         invoice_item_count 3
      end
      
      after(:create) do |item, evaluator|   
        create_list(:invoice_item, evaluator.invoice_item_count, item: item)   
      end
    end
  end

  factory :invoice do
    customer
    merchant
    status "active"
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
    
    factory :invoice_with_transactions do
      transient do
        transactions_count 3
      end
      
      after(:create) do |invoice, evaluator|   
        create_list(:transaction, evaluator.transactions_count, invoice: invoice)   
      end
    end

    factory :invoice_with_invoice_items do
      transient do
        invoice_items_count 3
      end
          
      after(:create) do |invoice, evaluator|   
        create_list(:invoice_item, evaluator.invoice_items_count, invoice: invoice)   
      end
    end
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

  factory :transaction do
    invoice
    credit_card_number "4354495077693036"
    result "success"
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-03-27 14:53:59 UTC'
  end
end
