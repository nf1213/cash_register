class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionHelper

  def authenticate
    if current_employee
      if current_employee.restaurant_id != current_restaurant.id || current_restaurant == nil
        session[:restaurant_id] = nil
        session[:user_id] = nil
        redirect_to restaurant_sign_in_path, alert: "Please sign in restaurant"
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

  def must_be_manager
    if current_employee.status != "Manager"
      redirect_to root_path, alert: "You are not authorized for this"
    end
  end
end
