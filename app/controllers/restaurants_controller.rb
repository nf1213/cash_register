class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to items_path, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
