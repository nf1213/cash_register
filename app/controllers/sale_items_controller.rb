class SaleItemsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate

  def create
    item = Item.find(params[:sale_item][:item_id])
    sale_item = SaleItem.new(item: item, name: item.name, price: item.price)
    sale_item.sale = current_sale
    sale_item.restaurant_id = current_restaurant.id
    update_total = sale_item.sale.total + sale_item.price
    sale_item.sale.update(total: update_total )
    if sale_item.save
      redirect_to sale_item_path(sale_item)
    end
  end

  def destroy
    @sale_item = SaleItem.find(params[:id])
    update_total = @sale_item.sale.total - @sale_item.price
    @sale_item.sale.update(total: update_total )
    @sale_item.destroy
    redirect_to root_path, alert: "Item voided"
  end

  def show
    @sale_item = SaleItem.find(params[:id])
    @sale = current_sale
  end
end
