module ApplicationHelper
  def current_employee
    if session[:user_id]
      Employee.find(session[:user_id])
    end
    # Employee.find_by signed_in: true
  end
end
