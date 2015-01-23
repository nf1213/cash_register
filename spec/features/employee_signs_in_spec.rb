require "rails_helper"

feature "Employee signs in" do

  before(:each) do
    @restaurant = factory_for_restaurant
    sign_in_restaurant(@restaurant)
  end

  scenario "with valid credentials" do
    employee = factory_for_employee(@restaurant)

    visit employees_sign_in_path

    select employee.name, from: "Name"
    fill_in "Password", with: password

    click_on "Sign in"

    expect(page).to have_content "Login success"
    expect(page).to have_content @restaurant.name

  end

  scenario "with invalid credentials" do
    visit employees_sign_in_path

    click_on "Sign in"

    expect(page).to have_content "Invalid credentials"
  end

end
