class SalesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager, only: [:index]

  def update
    @sale = Sale.find(params[:id])
    current_employee.update(current_sale: nil)
    redirect_to root_path
  end

  def destroy
    @sale = Sale.find(params[:id])
    current_employee.update(current_sale: nil)
    @sale.destroy
    redirect_to root_path, alert: "Transaction cancelled"
  end

  def index
    @sales = Sale.all
    @items = Item.all
  end

  def destroy_all
    Sale.destroy_all
    redirect_to root_path, alert "Sales Destroyed"
  end
end
