module ApplicationHelper
  def current_employee
    Employee.first
  end
end
