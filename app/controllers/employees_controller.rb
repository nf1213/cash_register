class EmployeesController < ApplicationController

  def sign_in
    @employee = Employee.new
  end

  def sign_in_employee
    name = params[:employee][:name]
    password = params[:employee][:password]
    if Employee.find_by name: name, password: password
      user = Employee.find_by name: name, password: password
      user.update(signed_in: true)
      redirect_to items_path, notice: "Login success"
    else
      redirect_to employees_sign_in_path, notice: "Invalid credentials"
    end
  end

  def sign_out
    current_user.update(signed_in: false)
    redirect_to employees_sign_in_path, notice: "Signed out"
  end

end
