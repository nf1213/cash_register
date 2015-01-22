class RestaurantsController < ApplicationController
  before_action :no_restaurant_exists

  def no_restaurant_exists
    if Restaurant.count > 0
      redirect_to root_path, alert: "Restaurant already exists"
    end
  end

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
