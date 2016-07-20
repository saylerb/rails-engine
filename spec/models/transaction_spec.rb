require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction_instance) { build(:transaction) }

  it "has a valid factory" do
    expect(transaction_instance).to be_valid
    expect(transaction_instance).to respond_to(:invoice)
    expect(transaction_instance).to respond_to(:credit_card_number)
    expect(transaction_instance).to respond_to(:credit_card_expiration_date)
    expect(transaction_instance).to respond_to(:result)
    expect(transaction_instance).to respond_to(:created_at)
    expect(transaction_instance).to respond_to(:updated_at)
  end

  describe "validates attributes" do
    it { expect(transaction_instance).to validate_presence_of(:invoice) }
    it { expect(transaction_instance).to validate_presence_of(:credit_card_number) }
    it { expect(transaction_instance).to validate_presence_of(:result) }
    it { expect(transaction_instance).to validate_presence_of(:created_at) }
    it { expect(transaction_instance).to validate_presence_of(:updated_at) }
  end

  describe "has the correct associations" do
    it { expect(transaction_instance).to belong_to(:invoice) }
  end
end
