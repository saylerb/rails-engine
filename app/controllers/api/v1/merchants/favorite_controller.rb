class Api::V1::Merchants::FavoriteController < ApplicationController
  def show
    respond_with Merchant.find(params[:id]).favorite_customer
  end
end
