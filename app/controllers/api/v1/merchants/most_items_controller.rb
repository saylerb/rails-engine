class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    respond_with Merchant.top_merchants_by_items(params[:quantity])
  end
end
