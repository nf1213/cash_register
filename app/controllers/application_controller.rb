class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    unless current_employee
      redirect_to employees_sign_in_path
    end
  end

  def restaurant_exists?
    unless Restaurant.count > 0
      redirect_to new_restaurant_path
    end
  end

  def current_employee
    Employee.find_by signed_in: true
  end

  def must_be_manager
    if current_employee.status != "Manager"
      redirect_to root_path, notice: "You are not authorized for this"
    end
  end

  #change to current employee's sale
  def current_sale
    if !Sale.any?
      return Sale.create()
    elsif Sale.last.current
      return Sale.last
    else
      return Sale.create()
    end
  end
end
