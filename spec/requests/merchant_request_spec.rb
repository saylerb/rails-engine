require 'rails_helper'

RSpec.describe "Merchant record endpoint" do

  let(:merchant_instance) { create(:merchant) }

  it "returns the information for a single merchant" do

    get "/api/v1/merchants.json"

    expect(response).to be_success
    expect(json['name']).to eq(merchant_instance.name) 
    expect(json['created_at']).to eq('2012-03-27 14:53:59 UTC') 
    expect(json['updated_at']).to eq('2012-03-27 14:53:59 UTC') 
  end
end
