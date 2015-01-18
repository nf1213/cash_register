class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    unless current_employee
      redirect_to employees_sign_in_path, alert: "Please sign in"
    end
  end

  def restaurant_exists?
    unless Restaurant.count > 0
      redirect_to new_restaurant_path
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

  #change to current employee's sale
  def current_sale
    if current_employee
      if !current_employee.current_sale
        sale = Sale.create(employee: current_employee)
        current_employee.update(current_sale: sale.id )
        sale
      else
        Sale.find(current_employee.current_sale)
      end
    end
  end
end
