require 'rails_helper'

RSpec.describe "item record endpoint" do

  let!(:item1) { create(:item) }
  let!(:item2) { create(:item) }
  let!(:item3) { create(:item) }
  let!(:item4) { create(:item) }

  it "returns the information for a single item" do
    get "/api/v1/items"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(4)

    expect(data.first.length).to eq(5)
    expect(data.first[:id]).to eq(item1.id) 
    expect(data.first[:name]).to eq(item1.name) 
    expect(data.first[:merchant_id]).to eq(item1.merchant.id) 
    expect(data.first[:description]).to eq(item1.description) 
    
    expect(data.last.length).to eq(5)
    expect(data.last[:id]).to eq(item4.id) 
    expect(data.last[:name]).to eq(item4.name) 
    expect(data.last[:merchant_id]).to eq(item4.merchant.id) 
    expect(data.last[:description]).to eq(item4.description) 
  end

  it "returns the information for a single item" do
    get "/api/v1/items/#{item1.id}"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success

    expect(data.length).to eq(5)
   
    expect(data[:id]).to eq(item1.id) 
    expect(data[:name]).to eq(item1.name) 
    expect(data[:merchant_id]).to eq(item1.merchant.id) 
    expect(data[:description]).to eq(item1.description) 
  end

  it "returns a random item" do
    get "/api/v1/items/random"
    
    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Hash)
    expect(data.length).to eq(5)
    expect(data[:id]).to be_between(item1.id, item4.id).inclusive
  end
end
