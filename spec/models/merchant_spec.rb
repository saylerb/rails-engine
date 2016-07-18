require 'rails_helper'

RSpec.describe Merchant, type: :model do

  let(:merchant_instance) { build(:merchant) }

  it "has a valid factory" do
    expect(merchant_instance).to be_valid
    expect(merchant_instance).to respond_to(:name)
  end

  describe "validates attributes" do
    it { expect(merchant_instance).to validate_presence_of(:name) }
  end

end
