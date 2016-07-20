require 'rails_helper'

RSpec.describe "item finder" do
  let!(:item1) { create(:item) }
  let!(:item2) { create(:item) }
  let!(:item2_dup) { create(:item, name: item2.name) }

  it "finds a item by name" do
    get "/api/v1/items/find", params: { name: item1.name }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(item1.id) 
    expect(data[:name]).to eq(item1.name) 
    expect(data[:description]).to eq(item1.description) 
    expect(data[:merchant_id]).to eq(item1.merchant.id) 
  end

  it "finds a item by id" do

    get "/api/v1/items/find", params: { id: item2.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(item2.id) 
    expect(data[:name]).to eq(item2.name)
    expect(data[:description]).to eq(item2.description)
    expect(data[:merchant_id]).to eq(item2.merchant.id)
  end

  it "finds all items by name" do
    
    get "/api/v1/items/find_all", params: { name: item2.name } 

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Array)
    expect(data.length).to eq(2)

    expect(data.first[:id]).to eq(item2.id) 
    expect(data.first[:name]).to eq(item2.name) 
    expect(data.last[:id]).to eq(item2_dup.id) 
    expect(data.last[:name]).to eq(item2.name) 
  end

end
