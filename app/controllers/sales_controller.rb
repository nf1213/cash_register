class SalesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  
  def update
    @sale = Sale.find(params[:id])
    @sale.update(current: false)
    redirect_to root_path
  end
end
