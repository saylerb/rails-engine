class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    if params[:date]
      respond_with Merchant.find(params[:id]).revenue_for_day(params[:date])
    else
      respond_with Merchant.find(params[:id]).total_revenue
    end
  end
end

