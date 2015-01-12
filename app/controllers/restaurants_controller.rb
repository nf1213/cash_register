class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
    @employee = @restaurant.employees.build
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to root_path, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, employees_attributes: [:name, :password, :status])
  end
end
