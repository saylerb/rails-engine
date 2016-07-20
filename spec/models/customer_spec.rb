require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer_instance) { build(:customer) }

  it "has a valid factory" do
    expect(customer_instance).to be_valid
    expect(customer_instance).to respond_to(:first_name)
    expect(customer_instance).to respond_to(:last_name)
    expect(customer_instance).to respond_to(:created_at)
    expect(customer_instance).to respond_to(:updated_at)
  end

  describe "validates attributes" do
    it { expect(customer_instance).to validate_presence_of(:first_name) }
    it { expect(customer_instance).to validate_presence_of(:last_name) }
    it { expect(customer_instance).to validate_presence_of(:created_at) }
    it { expect(customer_instance).to validate_presence_of(:updated_at) }
  end

  describe "has the correct associations" do
    it { expect(customer_instance).to have_many(:invoices) }
  end
end
