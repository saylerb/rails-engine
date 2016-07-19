class Api::V1::Merchants::FindController < ApplicationController
  respond_to :json

  def show
   respond_with Merchant.where(merchant_params).take
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
