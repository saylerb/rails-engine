require 'rails_helper'

RSpec.describe "invoice item finder" do
  let!(:invoice_item1) { create(:invoice_item) }
  let!(:invoice_item2) { create(:invoice_item) }
  let!(:invoice_item2_dup) { create(:invoice_item, invoice: invoice_item2.invoice) }

  it "finds an invoice item by invoice" do
    get "/api/v1/invoice_items/find", params: { invoice_id: invoice_item1.invoice.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice_item1.id) 
    expect(data[:invoice_id]).to eq(invoice_item1.invoice.id) 
    expect(data[:item_id]).to eq(invoice_item1.item.id) 
  end

  it "finds an invoice item by id" do

    get "/api/v1/invoice_items/find", params: { id: invoice_item2.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice_item2.id) 
    expect(data[:invoice_id]).to eq(invoice_item2.invoice.id)
    expect(data[:item_id]).to eq(invoice_item2.item.id)
  end

  it "finds all invoice items by invoice" do
    
    get "/api/v1/invoice_items/find_all", params: { invoice_id: invoice_item2.invoice.id } 

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Array)
    expect(data.length).to eq(2)

    expect(data.first[:id]).to eq(invoice_item2.id) 
    expect(data.first[:invoice_id]).to eq(invoice_item2.invoice.id) 
    expect(data.last[:id]).to eq(invoice_item2_dup.id) 
    expect(data.last[:invoice_id]).to eq(invoice_item2.invoice.id) 
  end

end
