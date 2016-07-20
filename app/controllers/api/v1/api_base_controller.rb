class Api::V1::ApiBaseController < ApplicationController
  def index
    respond_with model.all
  end

  def show
    respond_with model.find(params[:id])
  end

  def random
    respond_with model.random
  end

  def find
    if model_params[:unit_price]
      unit_price_integer = (BigDecimal(model_params[:unit_price])*100).to_i
      respond_with model.find_by(unit_price: unit_price_integer)
    else
      respond_with model.find_by(model_params)
    end
  end
  
  def find_all
    if model_params[:unit_price]
      unit_price_integer = (BigDecimal(model_params[:unit_price])*100).to_i
      respond_with model.where(unit_price: unit_price_integer)
    else
      respond_with model.where(model_params)
    end
  end

  private

  def model_params
    params.permit(*model.column_names.map(&:to_sym))
  end
end
