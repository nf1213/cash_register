module ApplicationHelper

  def current_employee
    Employee.find_by signed_in: true
  end
end
