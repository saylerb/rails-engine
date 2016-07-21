require 'rails_helper'

RSpec.describe "Merchant business logic" do

  context "single merchant" do
    it "returns the total revenue for a single merchant" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant: merchant)
      transaction1 = create(:transaction, invoice: invoice, result: 'success')
      transaction2 = create(:transaction, invoice: invoice, result: 'failure')
      invoice_item = create(:invoice_item, invoice: invoice)

      get "/api/v1/merchants/#{merchant.id}/revenue"

      expect(response).to be_success

      data = JSON.parse(response.body, symbolize_names: :true )

      serialized_result = ((invoice_item.quantity * invoice_item.unit_price)/100.0).to_s
      expect(data).to eq(revenue: serialized_result)
    end

    it "returns the favorite customer for a single merchant" do
      merchant = create(:merchant)

      customer1, customer2 = create_list(:customer, 2)

      invoice1 = create(:invoice, merchant: merchant, customer: customer1)
      invoice2 = create(:invoice, merchant: merchant, customer: customer2)

      create_list(:transaction, 3, invoice: invoice1, result: 'success')

      create(:transaction, invoice: invoice2, result: 'success')
      create_list(:transaction, 2, invoice: invoice2, result: 'failure')

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"

      expect(response).to be_success

      data = JSON.parse(response.body, symbolize_names: :true )

      expect(data[:id]).to eq(customer1.id)
    end
    
    it "returns the total revenue for a single merchant for a specific invoice date" do
      merchant = create(:merchant)
      invoice_2013 = create(:invoice,
                            merchant: merchant,
                            created_at: '2013-03-27 14:53:59',
                            updated_at: '2013-03-27 14:53:59')
      create_list(:invoice_item, 3, invoice: invoice_2013, quantity: 1, unit_price: 100)

      create(:transaction, invoice: invoice_2013)

      revenue = invoice_2013.invoice_items.map do |invoice|
        invoice.quantity * invoice.unit_price
      end.reduce(:+)

      serialized_revenue = (revenue/100.0).to_s

      get "/api/v1/merchants/#{merchant.id}/revenue", params: { date: '2013-03-27 14:53:59 UTC' }

      data = JSON.parse(response.body, symbolize_names: :true )

      expect(data[:revenue]).to eq(serialized_revenue)
    end
  end

  context "multiple merchants" do
    it "returns the top x merchants by total revenue" do
      merchant1, merchant2, merchant3, merchant4 = create_list(:merchant, 4)

      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant3)

      create_list(:invoice_item, 3, invoice: invoice1, quantity: 1, unit_price: 100)
      create_list(:invoice_item, 3, invoice: invoice2, quantity: 1, unit_price: 200)
      create_list(:invoice_item, 3, invoice: invoice3, quantity: 1, unit_price: 300)

      get "/api/v1/merchants/most_revenue", params: { quantity: 3 }

      data = JSON.parse(response.body, symbolize_names: :true )

      expect(data.length).to eq(3)
      expect(data.first[:id]).to eq(merchant3.id)
      expect(data.last[:id]).to eq(merchant1.id)
    end
    
    it "returns the top x merchants by total number of items sold" do
      merchant1, merchant2, merchant3, merchant4= create_list(:merchant, 4)

      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant3)

      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice3)

      create_list(:invoice_item, 1, invoice: invoice1, quantity: 1, unit_price: 100)
      create_list(:invoice_item, 2, invoice: invoice2, quantity: 1, unit_price: 100)
      create_list(:invoice_item, 3, invoice: invoice3, quantity: 1, unit_price: 100)

      get "/api/v1/merchants/most_items", params: { quantity: 3 }

      data = JSON.parse(response.body, symbolize_names: :true )

      expect(data.length).to eq(3)
      expect(data.first[:id]).to eq(merchant3.id)
      expect(data.last[:id]).to eq(merchant1.id)
    end
  end
end
