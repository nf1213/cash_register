require "rails_helper"

feature "Employee signs in" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(@restaurant)
  end

  scenario "with valid credentials" do
    employee = FactoryGirl.create(:employee, restaurant: @restaurant)

    visit employees_sign_in_path

    select employee.name, from: "Name"
    fill_in "Password", with: employee.password

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
