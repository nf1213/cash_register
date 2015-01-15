class SalesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate

  def update
    @sale = Sale.find(params[:id])
    current_employee.update(current_sale: nil)
    redirect_to root_path
  end
end
