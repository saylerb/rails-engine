require 'rails_helper'

RSpec.describe "Merchant record endpoint" do

  let!(:merchant1) { create(:merchant) }
  let!(:merchant2) { create(:merchant) }
  let!(:merchant3) { create(:merchant) }
  let!(:merchant4) { create(:merchant) }

  it "returns the information for a single merchant" do
    get "/api/v1/merchants"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data.length).to eq(4)

    expect(data.first.length).to eq(2)
    expect(data.first[:id]).to eq(merchant1.id) 
    expect(data.first[:name]).to eq(merchant1.name) 
    
    expect(data.last.length).to eq(2)
    expect(data.last[:id]).to eq(merchant4.id) 
    expect(data.last[:name]).to eq(merchant4.name) 
  end

  it "returns the information for a single merchant" do
    get "/api/v1/merchants/#{merchant1.id}"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success

    expect(data.length).to eq(2)
   
    expect(data[:id]).to eq(merchant1.id) 
    expect(data[:name]).to eq(merchant1.name) 
  end

  it "returns a random merchant" do
    get "/api/v1/merchants/random"
    
    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Hash)
    expect(data.length).to eq(2)
    expect(data[:id]).to be_between(merchant1.id, merchant4.id).inclusive
  end
end
