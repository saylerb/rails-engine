class Api::V1::Merchants::RandomController < ApplicationController
  def show
   respond_with Merchant.random
  end
end
