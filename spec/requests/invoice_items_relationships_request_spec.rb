require 'rails_helper'

RSpec.describe "invoice item relationship endpoint" do
  let!(:invoice_item_instance) { create(:invoice_item) }
  #let!(:item_with_invoice_items) { create(:item_with_invoice_items) }

  it "returns the invoice for a single invoice item" do
    get "/api/v1/invoice_items/#{invoice_item_instance.id}/invoice"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice_item_instance.invoice.id)
  end

  it "returns the item for a single invoice item" do
    get "/api/v1/invoice_items/#{invoice_item_instance.id}/item"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice_item_instance.item.id)
  end
end
