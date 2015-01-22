class ItemsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager, only: [:new, :create, :edit, :edit_index, :update, :destroy]

  def index
    @items = Item.all
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
  end

  def edit_index
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    price = params[:item][:price].to_f * 100
    @item.update(price: price)
    if @item.save
      redirect_to items_edit_index_path, notice: "Item Updated"
    else
      render :edit
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_edit_index_path, notice: "Item Deleted"
  end

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
