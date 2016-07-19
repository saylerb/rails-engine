require 'rails_helper'

RSpec.describe "Merchant record endpoint" do

  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }
  let!(:merchant_3) { create(:merchant) }
  let!(:merchant_4) { create(:merchant) }

  it "returns the information for a single merchant" do
    get "/api/v1/merchants.json"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(4)

    expect(data.first.length).to eq(4)
    expect(data.first[:id]).to eq(merchant_1.id) 
    expect(data.first[:name]).to eq(merchant_1.name) 
    expect(data.first[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data.first[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
    
    expect(data.last.length).to eq(4)
    expect(data.last[:id]).to eq(merchant_4.id) 
    expect(data.last[:name]).to eq(merchant_4.name) 
    expect(data.last[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data.last[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
  end



  it "returns the information for a single merchant" do
    get "/api/v1/merchants/1.json"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(1)

    expect(data.first.length).to eq(4)
    expect(data.first[:id]).to eq(merchant_1.id) 
    expect(data.first[:name]).to eq(merchant_1.name) 
    expect(data.first[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data.first[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
  end

end
