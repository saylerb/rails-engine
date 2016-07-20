require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do

  let(:invoice_item_instance) { build(:invoice_item) }

  it "has a valid factory" do
    expect(invoice_item_instance).to be_valid
    expect(invoice_item_instance).to respond_to(:invoice)
    expect(invoice_item_instance).to respond_to(:item)
    expect(invoice_item_instance).to respond_to(:quantity)
    expect(invoice_item_instance).to respond_to(:unit_price)
    expect(invoice_item_instance).to respond_to(:created_at)
    expect(invoice_item_instance).to respond_to(:updated_at)
  end

  describe "validates attributes" do
    it { expect(invoice_item_instance).to validate_presence_of(:invoice) }
    it { expect(invoice_item_instance).to validate_presence_of(:item) }
    it { expect(invoice_item_instance).to validate_presence_of(:quantity) }
    it { expect(invoice_item_instance).to validate_presence_of(:unit_price) }
    it { expect(invoice_item_instance).to validate_presence_of(:created_at) }
    it { expect(invoice_item_instance).to validate_presence_of(:updated_at) }
  end

  describe "has the correct associations" do
    it { expect(invoice_item_instance).to belong_to(:invoice) }
    it { expect(invoice_item_instance).to belong_to(:item) }
  end
end
