require "rails_helper"

feature "Employee signs out" do

  scenario "." do
    restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(restaurant)
    employee = FactoryGirl.create(:employee, restaurant: restaurant)

    sign_in_as(employee)

    visit root_path

    click_on "Sign Out"

    expect(page).to have_content "Signed out"
    expect(page).to have_content "Sign In"

  end

end
