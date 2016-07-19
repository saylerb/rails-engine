require 'rails_helper'

RSpec.describe "Merchant finder" do
  let!(:merchant1) { create(:merchant) }
  let!(:merchant2) { create(:merchant) }
  let!(:merchant2_dup) { create(:merchant, name: merchant2.name) }

  it "finds a merchant by name" do
    get "/api/v1/merchants/find", params: { name: merchant1.name }


    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(merchant1.id) 
    expect(data[:name]).to eq(merchant1.name) 
  end

  it "finds a merchant by id" do

    get "/api/v1/merchants/find", params: { id: merchant2.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(merchant2.id) 
    expect(data[:name]).to eq(merchant2.name)
  end

  it "finds all merchants by name" do
    
    get "/api/v1/merchants/find_all", params: { name: merchant2.name } 

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Array)
    expect(data.length).to eq(2)

    expect(data.first[:id]).to eq(merchant2.id) 
    expect(data.first[:name]).to eq(merchant2.name) 
    expect(data.last[:id]).to eq(merchant2_dup.id) 
    expect(data.last[:name]).to eq(merchant2.name) 
  end

end
