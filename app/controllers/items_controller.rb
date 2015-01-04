class ItemsController < ApplicationController
  before_action :authenticate

  def index
    if Restaurant.count < 1
      redirect_to new_restaurant_path
    end
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to @item
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
  end

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
