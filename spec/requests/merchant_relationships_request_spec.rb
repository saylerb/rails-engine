require 'rails_helper'

RSpec.describe "Merchant relationship endpoint" do
  let!(:merchant_with_items) { create(:merchant_with_items) }
  let!(:merchant_with_invoices) { create(:merchant_with_invoices) }

  it "returns the items for a single merchant" do
    get "/api/v1/merchants/#{merchant_with_items.id}/items"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.length).to eq(3)

    expect(data.first[:id]).to eq(merchant_with_items.items.first.id)
    expect(data.last[:id]).to eq(merchant_with_items.items.last.id)
  end

  it "returns the invoices for a single merchant" do
    get "/api/v1/merchants/#{merchant_with_invoices.id}/invoices"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.length).to eq(3)

    expect(data.first[:id]).to eq(merchant_with_invoices.invoices.first.id)
    expect(data.last[:id]).to eq(merchant_with_invoices.invoices.last.id)
  end
end
