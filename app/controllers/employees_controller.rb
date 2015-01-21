class EmployeesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate, only: [:new, :create, :index, :destroy, :edit, :update, :payroll]
  before_action :must_be_manager, only: [:new, :create, :index, :destroy, :edit, :update, :payroll]

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
    @employee.update(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee updated"
    else
      render :edit
    end
  end

  # def sign_in
  #   @employee = Employee.new
  #   Employee.update_all(signed_in: false)
  # end

  def sign_in_employee
    name = params[:employee][:name]
    password = params[:employee][:password]
    user = Employee.find_by name: name, password: password
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login success"
    else
      redirect_to employees_sign_in_path, alert: "Invalid credentials"
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to employees_sign_in_path, notice: "Signed out"
  end

  def payroll
    @employees = Employee.all
  end

  def clock_in_out

  end

  def clock
    name = params[:employee][:name]
    password = params[:employee][:password]
    employee = Employee.find_by name: name, password: password
    if employee
      if !employee.current_shift
        clock_in(employee)
        redirect_to employees_clock_in_out_path, notice: "Clocked in"
      else
        clock_out(employee)
        redirect_to employees_clock_in_out_path, notice: "Clocked out"
      end
    else
      redirect_to employees_clock_in_out_path, alert: "Invalid credentials"
    end
  end

  def clock_in(employee)
    shift = Shift.create(employee: employee, clock_in: Time.now)
    employee.update(current_shift: shift.id)
  end

  def clock_out(employee)
    shift = Shift.find(employee.current_shift)
    shift.update(employee: employee, clock_out: Time.now)
    employee.update(current_shift: nil)
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :password, :password_confirmation, :status, :salary)
  end

end
