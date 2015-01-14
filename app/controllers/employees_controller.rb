class EmployeesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate, only: [:new, :create, :index, :destroy, :edit, :update]
  before_action :must_be_manager, only: [:new, :create, :index, :destroy, :edit, :update]

  def index
    @employees = Employee.all
  end

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

  def destroy
    Employee.find(params[:id]).destroy
    redirect_to employees_path, notice: "Employee deleted"
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    salary = params[:employee][:salary].to_f * 100
    if salary < 800
      redirect_to edit_employee_path(@employee), notice: "Salary must be a number higher than $8.00"
    else
      @employee.update(salary: salary)
      redirect_to employees_path, notice: "Salary updated"
    end
  end

  # def sign_in
  #   @employee = Employee.new
  #   Employee.update_all(signed_in: false)
  # end

  def sign_in_employee
    name = params[:employee][:name]
    password = params[:employee][:password]
    if Employee.find_by name: name, password: password
      user = Employee.find_by name: name, password: password
      user.update(signed_in: true)
      Shift.create(employee: user, clock_in: Time.now)
      redirect_to root_path, notice: "Login success"
    else
      redirect_to employees_sign_in_path, notice: "Invalid credentials"
    end
  end

  def sign_out
    current_shift.update(clock_out: Time.now)
    current_employee.update(signed_in: false)
    redirect_to employees_sign_in_path, notice: "Signed out"
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :password, :status, :salary)
  end

end
