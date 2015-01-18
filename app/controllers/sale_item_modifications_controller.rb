class SaleItemModificationsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate

  def new
    @sale_item_modification = SaleItemModification.new
  end

  def create
    @sale_item_modification = SaleItemModification.where(s_i_modification_params).first_or_create
    if @sale_item_modification.current_count < @sale_item_modification.modification.limit
      update = @sale_item_modification.current_count + 1;
      @sale_item_modification.update(current_count: update)
    end
    redirect_to sale_item_path(@sale_item_modification.sale_item_id)
  end

  def destroy
    @sale_item_modification = SaleItemModification.find(params[:id])
    update = @sale_item_modification.current_count - 1;
    @sale_item_modification.update(current_count: update)
    redirect_to root_path, notice: "Modification removed"
  end

  private

  def s_i_modification_params
    params.require(:sale_item_modification).permit(:sale_item_id, :modification_id)
  end

end
