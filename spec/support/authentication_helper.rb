module AuthenticationHelper
  def sign_in_as(employee)
    visit employees_sign_in_path
    select employee.name, from: "Name"
    fill_in "Password", with: employee.password

    click_on "Sign in"
  end

  def factory_for_employee
    @employee = Employee.create(name: "Bob", password: 333333, status: "Employee", salary: 800)
    FactoryGirl.build(:employee)
  end

  def factory_for_employee2
    @employee = Employee.create(name: "Fred", password: 333333, status: "Employee", salary: 800)
    FactoryGirl.build(:employee, name: "Fred")
  end

  def factory_for_manager
    @manager = Employee.create(name: "Nicole", password: 333333, status: "Manager", salary: 800)
    FactoryGirl.build(:employee, name: "Nicole", status: "Manager")
  end
end
