class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    respond_with Merchant.find(params[:id]).items
  end
end
