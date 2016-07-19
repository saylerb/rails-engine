require 'rails_helper'

RSpec.describe "customer finder" do
  let!(:customer1) { create(:customer) }
  let!(:customer2) { create(:customer) }
  let!(:customer2_dup) { create(:customer,
                                first_name: customer2.first_name,
                                last_name: customer2.last_name) }

  it "finds a customer by name" do
    get "/api/v1/customers/find", params: { first_name: customer1.first_name }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(customer1.id) 
    expect(data[:first_name]).to eq(customer1.first_name) 
    expect(data[:last_name]).to eq(customer1.last_name) 
  end

  it "finds a customer by id" do

    get "/api/v1/customers/find", params: { id: customer2.id }

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data[:id]).to eq(customer2.id) 
    expect(data[:first_name]).to eq(customer2.first_name)
    expect(data[:last_name]).to eq(customer2.last_name)
  end

  it "finds all customers by name" do
    
    get "/api/v1/customers/find_all", params: { first_name: customer2.first_name } 

    expect(response).to be_success

    data = JSON.parse(response.body, symbolize_names: :true )

    expect(data).to be_kind_of(Array)
    expect(data.length).to eq(2)

    expect(data.first[:id]).to eq(customer2.id) 
    expect(data.first[:first_name]).to eq(customer2.first_name) 
    expect(data.last[:id]).to eq(customer2_dup.id) 
    expect(data.last[:first_name]).to eq(customer2.first_name) 
  end

end
