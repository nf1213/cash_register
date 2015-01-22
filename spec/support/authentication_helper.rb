module AuthenticationHelper
  def sign_in_as(employee)
    visit employees_sign_in_path

    select employee.name, from: "Name"
    fill_in "Password", with: employee.password

    click_on "Sign in"
  end

  def sign_in_restaurant(restaurant)
    visit restaurants_sign_in_path
    fill_in "Name", with: restaurant.name
    fill_in "Password", with: restaurant.password

    click_on "Sign in"
    save_and_open_page 
  end

  def factory_for_employee(restaurant)
    @employee = Employee.create(name: "Bob", password: 333333, status: "Employee", salary: 800, restaurant: restaurant)
    FactoryGirl.build(:employee, restaurant: restaurant)
  end

  def factory_for_employee2
    @employee = Employee.create(name: "Fred", password: 333333, status: "Employee", salary: 800)
    FactoryGirl.build(:employee, name: "Fred")
  end

  def factory_for_manager
    @manager = Employee.create(name: "Nicole", password: 333333, status: "Manager", salary: 800)
    FactoryGirl.build(:employee, name: "Nicole", status: "Manager")
  end

  def factory_for_restaurant
    Restaurant.create(name: "Factory Girl's Food", password: 333333)
    FactoryGirl.build(:restaurant)
  end
end
