require 'rails_helper'

RSpec.describe "Customer relationship endpoint" do
  let!(:customer_instance) { create(:customer_with_invoices_and_transactions) }

  it "returns the invoices for a single customer" do
    get "/api/v1/customers/#{customer_instance.id}/invoices"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )


    expect(data.length).to eq(3)

    expect(data.first[:id]).to eq(customer_instance.invoices.first.id)
    expect(data.last[:id]).to eq(customer_instance.invoices.last.id)
  end

  it "returns the transactions for a single customer" do
    get "/api/v1/customers/#{customer_instance.id}/transactions"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.length).to eq(9)

    expect(data.first[:id]).to eq(customer_instance.transactions.first.id)
    expect(data.last[:id]).to eq(customer_instance.transactions.last.id)
  end
end
