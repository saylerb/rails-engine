class Api::V1::CustomersController < ApplicationController
  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def random
   respond_with Customer.order("RANDOM()").limit(1).take
  end
end
