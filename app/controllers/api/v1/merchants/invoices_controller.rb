class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    respond_with Merchant.find(params[:id]).invoices
  end
end
