class Api::V1::ItemsController < Api::V1::ApiBaseController
  def model
    Item
  end

  def merchant
    respond_with Item.find(params[:id]).merchant
  end

  def invoice_items
    respond_with Item.find(params[:id]).invoice_items
  end
end
