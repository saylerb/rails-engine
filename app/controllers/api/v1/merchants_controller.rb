class Api::V1::MerchantsController < Api::V1::ApiBaseController
  def model
    Merchant
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end
end
