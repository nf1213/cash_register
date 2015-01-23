class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if current_employee
      if current_employee.restaurant_id != current_restaurant.id
        redirect_to root_path, alert: "Something is wrong here..."
      end
    else
      redirect_to employees_sign_in_path, alert: "Please Sign In"
    end
  end

  def restaurant_exists?
    unless session[:restaurant_id]
      redirect_to restaurants_sign_in_path, alert: "Please Sign in with your Restaurant's credentials"
    end
  end

  def current_employee
    if session[:user_id]
      Employee.find(session[:user_id])
    end
  end

  def must_be_manager
    if current_employee.status != "Manager"
      redirect_to root_path, alert: "You are not authorized for this"
    end
  end

  def current_sale
    if current_employee
      if !current_employee.current_sale
        sale = Sale.create(employee: current_employee, restaurant: current_restaurant)
        current_employee.update(current_sale: sale.id )
        sale
      else
        Sale.find(current_employee.current_sale)
      end
    end
  end

  def current_restaurant
    if session[:restaurant_id]
      Restaurant.find(session[:restaurant_id])
    end
  end
end
