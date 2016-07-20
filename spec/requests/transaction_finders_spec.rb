require 'rails_helper'

RSpec.describe "transaction finder" do
  let!(:transaction1) { create(:transaction) }
  let!(:transaction2) { create(:transaction) }
  let!(:transaction2_dup) { create(:transaction, invoice: transaction2.invoice) }

  it "finds a transaction by invoice" do
    get "/api/v1/transactions/find", params: { invoice: transaction1.invoice }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(transaction1.id) 
    expect(data[:invoice_id]).to eq(transaction1.invoice.id) 
    expect(data[:result]).to eq(transaction1.result) 
    expect(data[:credit_card_number]).to eq(transaction1.credit_card_number) 
  end

  it "finds a transaction by id" do

    get "/api/v1/transactions/find", params: { id: transaction2.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(transaction2.id) 
    expect(data[:invoice_id]).to eq(transaction2.invoice.id)
    expect(data[:result]).to eq(transaction2.result)
    expect(data[:credit_card_number]).to eq(transaction2.credit_card_number)
  end

  it "finds all transactions by invoice" do
    
    get "/api/v1/transactions/find_all", params: { invoice_id: transaction2.invoice.id } 

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )


    expect(data).to be_kind_of(Array)
    expect(data.length).to eq(2)

    expect(data.first[:id]).to eq(transaction2.id) 
    expect(data.first[:invoice_id]).to eq(transaction2.invoice.id) 
    expect(data.last[:id]).to eq(transaction2_dup.id) 
    expect(data.last[:invoice_id]).to eq(transaction2.invoice.id) 
  end
end
