class SalesController < ApplicationController
  def update
    @sale = Sale.find(params[:id])
    @sale.update(current: false)
    redirect_to root_path
  end
end
