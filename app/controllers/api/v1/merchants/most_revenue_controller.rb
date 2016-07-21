class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    respond_with Merchant.top_merchants_by_revenue(params[:quantity])
  end
end
