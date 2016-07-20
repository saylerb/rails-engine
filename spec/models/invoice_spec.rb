require 'rails_helper'

RSpec.describe Invoice, type: :model do

  let(:invoice_instance) { build(:invoice) }

  it "has a valid factory" do
    expect(invoice_instance).to be_valid
    expect(invoice_instance).to respond_to(:customer)
    expect(invoice_instance).to respond_to(:merchant)
    expect(invoice_instance).to respond_to(:status)
    expect(invoice_instance).to respond_to(:created_at)
    expect(invoice_instance).to respond_to(:updated_at)
  end

  describe "validates attributes" do
    it { expect(invoice_instance).to validate_presence_of(:customer) }
    it { expect(invoice_instance).to validate_presence_of(:merchant) }
    it { expect(invoice_instance).to validate_presence_of(:status) }
    it { expect(invoice_instance).to validate_presence_of(:created_at) }
    it { expect(invoice_instance).to validate_presence_of(:updated_at) }
  end

  describe "has the correct associations" do
    it { expect(invoice_instance).to belong_to(:customer) }
    it { expect(invoice_instance).to belong_to(:merchant) }
  end



end
