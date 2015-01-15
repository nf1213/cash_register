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
    salary = params[:employee][:salary].to_f * 100
    if salary < 800
      redirect_to edit_employee_path(@employee), notice: "Salary must be a number higher than $8.00"
    else
      @employee.update(salary: salary)
      @employee.update(status: params[:employee][:status])
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
    user = Employee.find_by name: name, password: password
    if user
      user.update(signed_in: true)
      if user.current_shift
        redirect_to root_path, notice: "Login success"
      else
        clock_in(user)
        redirect_to root_path, notice: "Login success, Clocked in"
      end
    else
      redirect_to employees_sign_in_path, notice: "Invalid credentials"
    end
  end

  def sign_out
    current_employee.update(signed_in: false)
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
        if employee.signed_in
          redirect_to employees_clock_in_out_path, notice: "Please sign out first"
        else
          clock_out(employee)
          redirect_to employees_clock_in_out_path, notice: "Clocked out"
        end
      end
    else
      redirect_to employees_clock_in_out_path, notice: "Invalid credentials"
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
    params.require(:employee).permit(:name, :password, :status, :salary)
  end

end
