require 'rails_helper'

RSpec.describe "invoice item record endpoint" do

  let!(:invoice_item1) { create(:invoice_item) }
  let!(:invoice_item2) { create(:invoice_item) }
  let!(:invoice_item3) { create(:invoice_item) }
  let!(:invoice_item4) { create(:invoice_item) }

  it "returns the information for a single invoice item" do
    get "/api/v1/invoice_items"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(4)

    expect(data.first.length).to eq(5)
    expect(data.first[:id]).to eq(invoice_item1.id) 
    expect(data.first[:invoice_id]).to eq(invoice_item1.invoice.id) 
    expect(data.first[:item_id]).to eq(invoice_item1.item.id) 
    expect(data.first[:quantity]).to eq(invoice_item1.quantity) 
    expect(data.first[:unit_price]).to eq((invoice_item1.unit_price/100.0).to_s) 
    
    expect(data.last.length).to eq(5)
    expect(data.last[:id]).to eq(invoice_item4.id) 
    expect(data.last[:invoice_id]).to eq(invoice_item4.invoice.id) 
    expect(data.last[:item_id]).to eq(invoice_item4.item.id) 
    expect(data.last[:quantity]).to eq(invoice_item4.quantity) 
    expect(data.last[:unit_price]).to eq((invoice_item4.unit_price/100.0).to_s) 
  end

  it "returns the information for a single invoice item" do
    get "/api/v1/invoice_items/#{invoice_item1.id}"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success

    expect(data.length).to eq(5)
   
    expect(data[:id]).to eq(invoice_item1.id) 
    expect(data[:invoice_id]).to eq(invoice_item1.invoice.id) 
    expect(data[:item_id]).to eq(invoice_item1.item.id) 
    expect(data[:quantity]).to eq(invoice_item1.quantity) 
    expect(data[:unit_price]).to eq((invoice_item1.unit_price/100.0).to_s) 
  end

  it "returns a random invoice item" do
    get "/api/v1/invoice_items/random"
    
    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Hash)
    expect(data.length).to eq(5)
    expect(data[:id]).to be_between(invoice_item1.id, invoice_item4.id).inclusive
  end
end
