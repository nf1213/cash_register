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
end
