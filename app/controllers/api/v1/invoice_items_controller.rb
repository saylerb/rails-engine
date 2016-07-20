class Api::V1::InvoiceItemsController < Api::V1::ApiBaseController
  def model
    InvoiceItem
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end
end
