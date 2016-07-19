class Api::V1::Merchants::RandomController < ApplicationController
  def show
   respond_with Merchant.order("RANDOM()").limit(1).take
  end
end
