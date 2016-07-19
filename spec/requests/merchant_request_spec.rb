require 'rails_helper'

RSpec.describe "Merchant record endpoint" do

  let!(:merchant_instance) { create(:merchant) }

  it "returns the information for a single merchant" do

    get "/api/v1/merchants.json"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.first.length).to eq(4)
    expect(data.first[:id]).to eq(merchant_instance.id) 
    expect(data.first[:name]).to eq(merchant_instance.name) 
    expect(data.first[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data.first[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
  end
end
