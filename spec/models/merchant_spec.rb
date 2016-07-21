require 'rails_helper'

RSpec.describe Merchant, type: :model do

  let(:merchant_instance) { build(:merchant) }

  it "has a valid factory" do
    expect(merchant_instance).to be_valid
    expect(merchant_instance).to respond_to(:name)
    expect(merchant_instance).to respond_to(:created_at)
    expect(merchant_instance).to respond_to(:updated_at)
    expect(merchant_instance).to respond_to(:items)
    expect(merchant_instance).to respond_to(:invoices)
    expect(merchant_instance).to respond_to(:transactions)
  end

  describe "validates attributes" do
    it { expect(merchant_instance).to validate_presence_of(:name) }
    it { expect(merchant_instance).to validate_presence_of(:created_at) }
    it { expect(merchant_instance).to validate_presence_of(:updated_at) }
  end

  describe "has the correct associations" do
    it { expect(merchant_instance).to have_many(:items) }
    it { expect(merchant_instance).to have_many(:invoices) }
    it { expect(merchant_instance).to have_many(:transactions) }
  end

end
