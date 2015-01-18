require "rails_helper"

feature "Employee signs out" do

  scenario "." do
    restaurant = FactoryGirl.create(:restaurant)
    employee = FactoryGirl.create(:employee)

    sign_in_as(employee)

    visit root_path

    click_on "Sign Out"

    expect(page).to have_content "Signed out"
    expect(page).to have_content "Sign In"

  end

end
