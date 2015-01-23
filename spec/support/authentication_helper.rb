module AuthenticationHelper
  def sign_in_as(employee)
    visit employees_sign_in_path

    select employee.name, from: "Name"
    fill_in "Password", with: password

    click_on "Sign in"
  end

  def sign_in_restaurant(restaurant)
    visit restaurants_sign_in_path
    fill_in "Name", with: restaurant.name
    fill_in "Password", with: password

    click_on "Sign in"
  end

  def password
    333333
  end

  def factory_for_employee(restaurant)
    Employee.create(name: "Bob", password: password, status: "Employee", salary: 800, restaurant: restaurant)
  end

  def factory_for_employee2(restaurant)
    Employee.create(name: "Fred", password: password, status: "Employee", salary: 800, restaurant: restaurant)
  end

  def factory_for_manager(restaurant)
    Employee.create(name: "Nicole", password: password, status: "Manager", salary: 800, restaurant: restaurant)
  end

  def factory_for_restaurant
    Restaurant.create(name: "Factory Girl's Food", password: password)
  end
end
