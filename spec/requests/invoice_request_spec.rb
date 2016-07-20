require 'rails_helper'

RSpec.describe "invoice record endpoint" do

  let!(:invoice1) { create(:invoice) }
  let!(:invoice2) { create(:invoice) }
  let!(:invoice3) { create(:invoice) }
  let!(:invoice4) { create(:invoice) }

  it "returns the information for a single invoice" do
    get "/api/v1/invoices"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(4)

    expect(data.first.length).to eq(4)
    expect(data.first[:id]).to eq(invoice1.id) 
    expect(data.first[:merchant_id]).to eq(invoice1.merchant.id) 
    expect(data.first[:customer_id]).to eq(invoice1.customer.id) 
    expect(data.first[:status]).to eq(invoice1.status) 
    
    expect(data.last.length).to eq(4)
    expect(data.last[:id]).to eq(invoice4.id) 
    expect(data.last[:merchant_id]).to eq(invoice4.merchant.id) 
    expect(data.last[:customer_id]).to eq(invoice4.customer.id) 
    expect(data.last[:status]).to eq(invoice4.status) 
  end

  it "returns the information for a single invoice" do
    get "/api/v1/invoices/#{invoice1.id}"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.length).to eq(4)
   
    expect(data[:id]).to eq(invoice1.id) 
    expect(data[:merchant_id]).to eq(invoice1.merchant.id) 
    expect(data[:customer_id]).to eq(invoice1.customer.id) 
    expect(data[:status]).to eq(invoice1.status) 
  end

  it "returns a random invoice" do
    get "/api/v1/invoices/random"
    
    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Hash)
    expect(data.length).to eq(4)
    expect(data[:id]).to be_between(invoice1.id, invoice4.id).inclusive
  end
end
