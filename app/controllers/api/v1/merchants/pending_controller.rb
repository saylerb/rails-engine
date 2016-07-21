class Api::V1::Merchants::PendingController < ApplicationController
  def index
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
