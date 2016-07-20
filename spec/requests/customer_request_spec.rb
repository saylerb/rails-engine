require 'rails_helper'

RSpec.describe "Customer record endpoint" do

  let!(:customer1) { create(:customer) }
  let!(:customer2) { create(:customer) }
  let!(:customer3) { create(:customer) }
  let!(:customer4) { create(:customer) }

  it "returns the information for a single customer" do
    get "/api/v1/customers"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success
    expect(data.length).to eq(4)

    expect(data.first.length).to eq(5)
    expect(data.first[:id]).to eq(customer1.id) 
    expect(data.first[:first_name]).to eq(customer1.first_name) 
    expect(data.first[:last_name]).to eq(customer1.last_name) 
    expect(data.first[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data.first[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
    
    expect(data.last.length).to eq(5)
    expect(data.last[:id]).to eq(customer4.id) 
    expect(data.last[:first_name]).to eq(customer4.first_name) 
    expect(data.last[:last_name]).to eq(customer4.last_name) 
    expect(data.last[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data.last[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
  end

  it "returns the information for a single customer" do
    get "/api/v1/customers/#{customer1.id}"

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(response).to be_success

    expect(data.length).to eq(5)
   
    expect(data[:id]).to eq(customer1.id) 
    expect(data[:first_name]).to eq(customer1.first_name) 
    expect(data[:last_name]).to eq(customer1.last_name) 
    expect(data[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
  end

  it "returns a random customer" do
    get "/api/v1/customers/random"
    
    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Hash)
    expect(data.length).to eq(5)
    expect(data[:id]).to be_between(customer1.id, customer4.id).inclusive
    expect(data[:created_at]).to eq('2012-03-27T14:53:59.000Z') 
    expect(data[:updated_at]).to eq('2012-03-27T14:53:59.000Z') 
  end
end
