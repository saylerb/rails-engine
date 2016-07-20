require 'rails_helper'

RSpec.describe Item, type: :model do

  let(:item_instance) { build(:item) }

  it "has a valid factory" do
    expect(item_instance).to be_valid
    expect(item_instance).to respond_to(:name)
    expect(item_instance).to respond_to(:merchant)
    expect(item_instance).to respond_to(:description)
    expect(item_instance).to respond_to(:unit_price)
    expect(item_instance).to respond_to(:created_at)
    expect(item_instance).to respond_to(:updated_at)
  end

  describe "validates attributes" do
    it { expect(item_instance).to validate_presence_of(:name) }
    it { expect(item_instance).to validate_presence_of(:description) }
    it { expect(item_instance).to validate_presence_of(:unit_price) }
    it { expect(item_instance).to validate_presence_of(:created_at) }
    it { expect(item_instance).to validate_presence_of(:updated_at) }
  end

  describe "has the correct associations" do
    it { expect(item_instance).to belong_to(:merchant) }
    it { expect(item_instance).to have_many(:invoice_items) }
  end

end
