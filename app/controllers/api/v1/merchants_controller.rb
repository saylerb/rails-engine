class Api::V1::MerchantsController < ApplicationController

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id)
  end
end
