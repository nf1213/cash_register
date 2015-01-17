class SaleItemModificationsController < ApplicationController

  def new
    @sale_item_modification = SaleItemModification.new
  end

  def create
    @sale_item_modification = SaleItemModification.create(s_i_modification_params)
    redirect_to sale_item_path(@sale_item_modification.sale_item_id)
  end

  private

  def s_i_modification_params
    params.require(:sale_item_modification).permit(:sale_item_id, :modification_id)
  end

end
