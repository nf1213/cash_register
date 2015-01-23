require "rails_helper"

feature "Employee clocks in or out" do

  before(:each) do
    restaurant = factory_for_restaurant
    sign_in_restaurant(restaurant)
    @employee = factory_for_employee(restaurant)
  end

  scenario "successfully clocks in and out" do
    sign_in_as(@employee)

    visit root_path

    expect(page).to have_content "Not clocked in"

    visit employees_clock_in_out_path

    select @employee.name, from: "Name"
    fill_in "Password", with: password
    click_on "Clock in/out"

    expect(page).to have_content "Clocked in"

    visit root_path

    expect(page).to have_content "Clocked in"

    visit employees_clock_in_out_path

    select @employee.name, from: "Name"
    fill_in "Password", with: password
    click_on "Clock in/out"

    expect(page).to have_content "Clocked out"
  end

  scenario "provides invalid credentials" do
    visit employees_clock_in_out_path

    click_on "Clock in/out"

    expect(page).to have_content "Invalid credentials"
  end

end
