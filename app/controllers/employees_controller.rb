class EmployeesController < ApplicationController
  before_action :restaurant_exists?
  before_action :must_be_manager, only: [:new, :create]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path, notice: "New employee created: #{@employee.name}"
    else
      render :new
    end
  end

  def sign_in
    @employee = Employee.new
    Employee.update_all(signed_in: false)
  end

  def sign_in_employee
    name = params[:employee][:name]
    password = params[:employee][:password]
    if Employee.find_by name: name, password: password
      user = Employee.find_by name: name, password: password
      user.update(signed_in: true)
      redirect_to root_path, notice: "Login success"
    else
      redirect_to employees_sign_in_path, notice: "Invalid credentials"
    end
  end

  def sign_out
    current_employee.update(signed_in: false)
    redirect_to employees_sign_in_path, notice: "Signed out"
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :password, :status)
  end

end
