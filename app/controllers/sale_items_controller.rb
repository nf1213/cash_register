class SaleItemsController < ApplicationController
  def create
    sale_item = SaleItem.new(sale_item_params)
    sale_item.sale = current_sale
    if sale_item.save
      redirect_to item_path(sale_item_params.item_id)
    else
      redirect_to root_path
    end
  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:item_id)
  end
end
