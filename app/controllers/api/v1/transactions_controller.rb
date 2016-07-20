class Api::V1::TransactionsController < Api::V1::ApiBaseController
  def model
    Transaction
  end

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end
end
