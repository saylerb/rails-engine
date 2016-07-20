class Api::V1::CustomersController < Api::V1::ApiBaseController
  def model
    Customer
  end

  def invoices
    respond_with Customer.find(params[:id]).invoices
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end
end
