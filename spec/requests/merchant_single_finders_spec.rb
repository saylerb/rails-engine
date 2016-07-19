require 'rails_helper'

RSpec.describe "Merchant finder" do
  let!(:merchant1) { create(:merchant) }
  let!(:merchant2) { create(:merchant) }

  it "finds a merchant by name" do
    get "/api/v1/merchants/find?name=#{merchant1.name}"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(merchant1.id) 
    expect(data[:name]).to eq(merchant1.name) 
  end

  it "finds a merchant by id" do
    get "/api/v1/merchants/find?id=#{merchant2.id}"

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(merchant2.id) 
    expect(data[:name]).to eq(merchant2.name)
  end

end
