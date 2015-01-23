class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save && @employee.save
      @employee = Employee.new(name: "Store Owner", password: @restaurant.password, status: "Manager", salary: 1000, restaurant_id: @restaurant.id)
      if @employee.save
        session[:user_id] = @employee.id
        redirect_to root_path, notice: 'Restaurant was successfully created, Store Owner user created with same password'
      else
        render :new
      end
    else
      render :new
    end
  end

  def sign_in
  end

  def sign_in_restaurant
    name = params[:restaurant][:name]
    password = params[:restaurant][:password]
    user = Restaurant.authenticate(name, password)
    if user
      session[:restaurant_id] = user.id
      redirect_to root_path, notice: "Login success"
    else
      redirect_to restaurants_sign_in_path, alert: "Invalid credentials"
    end
  end

  def sign_out
    session[:user_id] = nil
    session[:restaurant_id] = nil
    redirect_to restaurants_sign_in_path, notice: "Signed out of restaurant"
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :password, :password_confirmation)
  end
end
