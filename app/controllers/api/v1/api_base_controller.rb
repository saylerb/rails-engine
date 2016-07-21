class Api::V1::ApiBaseController < ApplicationController
  before_action :convert_currency

  def convert_currency
    if params[:unit_price]
      params[:unit_price] = (BigDecimal(params[:unit_price])*100).to_i 
    end
  end

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
    respond_with model.find_by(model_params)
  end
  
  def find_all
    respond_with model.where(model_params)
  end

  private

  def model_params
    params.permit(*model.column_names.map(&:to_sym))
  end
end
