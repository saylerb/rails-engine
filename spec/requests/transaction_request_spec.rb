require 'rails_helper'

RSpec.describe "transaction record endpoint" do

  let!(:transaction1) { create(:transaction) }
  let!(:transaction2) { create(:transaction) }
  let!(:transaction3) { create(:transaction) }
  let!(:transaction4) { create(:transaction) }

  it "returns the information for a single transaction" do
    get "/api/v1/transactions"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(4)

    expect(data.first.length).to eq(4)
    expect(data.first[:id]).to eq(transaction1.id) 
    expect(data.first[:credit_card_number]).to eq(transaction1.credit_card_number) 
    expect(data.first[:invoice_id]).to eq(transaction1.invoice.id) 
    expect(data.first[:result]).to eq(transaction1.result) 
    
    expect(data.last.length).to eq(4)
    expect(data.last[:id]).to eq(transaction4.id) 
    expect(data.last[:credit_card_number]).to eq(transaction4.credit_card_number) 
    expect(data.last[:invoice_id]).to eq(transaction4.invoice.id) 
    expect(data.last[:result]).to eq(transaction4.result) 
  end

  it "returns the information for a single transaction" do
    get "/api/v1/transactions/#{transaction1.id}"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success

    expect(data.length).to eq(4)
   
    expect(data[:id]).to eq(transaction1.id) 
    expect(data[:credit_card_number]).to eq(transaction1.credit_card_number) 
    expect(data[:invoice_id]).to eq(transaction1.invoice.id) 
    expect(data[:result]).to eq(transaction1.result) 
  end

  it "returns a random transaction" do
    get "/api/v1/transactions/random"
    
    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Hash)
    expect(data.length).to eq(4)
    expect(data[:id]).to be_between(transaction1.id, transaction4.id).inclusive
  end
end
