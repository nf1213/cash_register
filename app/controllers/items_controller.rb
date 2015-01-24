class ItemsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager, only: [:new, :create, :edit, :edit_index, :update, :destroy]

  def index
    @items = current_restaurant.items
    @sale = current_sale
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.price = params[:item][:price].to_f * 100
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @options = @item.modifications
  end

  def edit_index
    @items = current_restaurant.items
  end

  def update
    @item = Item.find(params[:id])
    @options = @item.modifications
    @item.update(item_params)
    price = params[:item][:price].to_f * 100
    @item.update(price: price)
    if @item.save
      redirect_to items_edit_index_path, notice: "Item Updated"
    else
      render :edit
    end
  end

  def remove_modifications
    modifications = params[:item][:modification_ids]
    modifications.delete("")
    item = params[:item][:item_id]
    modifications.each do |m|
      @modification_option = ModificationOption.find_by_item_id_and_modification_id(item, m)
      @modification_option.destroy
    end
    redirect_to items_edit_index_path, notice: "Modifications Removed"
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_edit_index_path, notice: "Item Deleted"
  end

  def item_params
    params.require(:item).permit(:name, :price, :restaurant_id)
  end
end
