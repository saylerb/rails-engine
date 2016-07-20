require 'rails_helper'

RSpec.describe "item relationship endpoint" do
  let!(:item_instance) { create(:item) }
  let!(:item_with_invoice_items) { create(:item_with_invoice_items) }

  it "returns the merchant for a single item" do
    get "/api/v1/items/#{item_instance.id}/merchant"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(item_instance.merchant.id)
  end

  it "returns the invoice items for a single item" do
    get "/api/v1/items/#{item_with_invoice_items.id}/invoice_items"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.length).to eq(3)

    expect(data.first[:id]).to eq(item_with_invoice_items.invoice_items.first.id)
    expect(data.last[:id]).to eq(item_with_invoice_items.invoice_items.last.id)
  end
end
