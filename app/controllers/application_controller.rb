class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if Restaurant.count > 0
      unless current_user
        redirect_to employees_sign_in_path
      end
    end
  end

  def current_user
    Employee.find_by signed_in: true
  end
end
