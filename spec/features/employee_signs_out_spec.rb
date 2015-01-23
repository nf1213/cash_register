require "rails_helper"

feature "Employee signs out" do

  scenario "." do
    restaurant = factory_for_restaurant
    sign_in_restaurant(restaurant)
    employee = factory_for_employee(restaurant)

    sign_in_as(employee)

    visit root_path

    click_on "Sign Out"

    expect(page).to have_content "Signed out"
    expect(page).to have_content "Sign In"

  end

end
