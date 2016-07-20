require 'rails_helper'

RSpec.describe "invoice finder" do
  let!(:invoice1) { create(:invoice) }
  let!(:invoice2) { create(:invoice) }
  let!(:invoice2_dup) { create(:invoice, customer: invoice2.customer) }

  it "finds a invoice by customer" do
    get "/api/v1/invoices/find", params: { customer_id: invoice1.customer.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice1.id) 
    expect(data[:customer_id]).to eq(invoice1.customer.id) 
    expect(data[:merchant_id]).to eq(invoice1.merchant.id) 
  end

  it "finds a invoice by id" do

    get "/api/v1/invoices/find", params: { id: invoice2.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice2.id) 
    expect(data[:customer_id]).to eq(invoice2.customer.id)
    expect(data[:merchant_id]).to eq(invoice2.merchant.id)
  end

  it "finds all invoices by customer" do
    
    get "/api/v1/invoices/find_all", params: { customer_id: invoice2.customer.id } 

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Array)
    expect(data.length).to eq(2)

    expect(data.first[:id]).to eq(invoice2.id) 
    expect(data.first[:customer_id]).to eq(invoice2.customer.id) 
    expect(data.last[:id]).to eq(invoice2_dup.id) 
    expect(data.last[:customer_id]).to eq(invoice2.customer.id) 
  end

end
