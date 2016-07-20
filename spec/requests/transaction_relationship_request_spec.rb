require 'rails_helper'

RSpec.describe "transaction relationship endpoint" do
  let!(:transaction_instance) { create(:transaction) }

  it "returns the invoice for a single transaction" do
    get "/api/v1/transactions/#{transaction_instance.id}/invoice"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(transaction_instance.invoice.id)
  end
end
