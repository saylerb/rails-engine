require 'rails_helper'

RSpec.describe "invoice relationship endpoint" do
  let!(:invoice_instance) { create(:invoice) }
  let!(:invoice_with_transactions) { create(:invoice_with_transactions) }
  let!(:invoice_with_invoice_items) { create(:invoice_with_invoice_items) }

  it "returns the customer for a single invoice" do
    get "/api/v1/invoices/#{invoice_instance.id}/customer"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice_instance.customer.id)
  end

  it "returns the merchant for a single invoice" do
    get "/api/v1/invoices/#{invoice_instance.id}/merchant"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(invoice_instance.merchant.id)
  end

  it "returns the transactions for a single invoice" do
    get "/api/v1/invoices/#{invoice_with_transactions.id}/transactions"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.first[:id]).to eq(invoice_with_transactions.transactions.first.id)
    expect(data.last[:id]).to eq(invoice_with_transactions.transactions.last.id)
  end

  it "returns the invoice items for a single invoice" do
    get "/api/v1/invoices/#{invoice_with_invoice_items.id}/invoice_items"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.first[:id]).to eq(invoice_with_invoice_items.invoice_items.first.id)
    expect(data.last[:id]).to eq(invoice_with_invoice_items.invoice_items.last.id)
  end

  it "returns the items for a single invoice" do
    get "/api/v1/invoices/#{invoice_with_invoice_items.id}/items"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.first[:id]).to eq(invoice_with_invoice_items.items.first.id)
    expect(data.last[:id]).to eq(invoice_with_invoice_items.items.last.id)
  end
end
