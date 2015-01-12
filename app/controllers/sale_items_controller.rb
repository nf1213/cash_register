class SaleItemsController < ApplicationController
  def create
    sale_item = SaleItem.new(sale_item_params)
    sale_item.sale = current_sale
    update_total = sale_item.sale.total + sale_item.item.price
    sale_item.sale.update(total: update_total )
    if sale_item.save
      redirect_to item_path(params[:sale_item][:item_id])
    else
      redirect_to root_path
    end
  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:item_id)
  end
end
