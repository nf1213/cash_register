require "rails_helper"

feature "Manager creates and employee spec" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(@restaurant)
  end

  scenario "Manager must be a signed in as a manager" do
    employee = FactoryGirl.create(:employee, restaurant: @restaurant)

    sign_in_as(employee)

    visit root_path
    expect(page).not_to have_content "Manager Functions"
    visit new_employee_path
    expect(page).to have_content "You are not authorized for this"
  end

  scenario "Manager provides valid information" do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)

    sign_in_as(manager)

    visit new_employee_path

    fill_in "Name", with: "Bob"
    fill_in "Password", with: 55555
    fill_in "Confirm", with: 55555
    select "Employee", from: "Status"
    fill_in "Salary", with: 9.00

    click_on "Create"

    expect(page).to have_content "New employee created: Bob"

  end

  scenario "Manager provides invalid information" do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)

    sign_in_as(manager)

    visit new_employee_path

    click_on "Create"

    expect(page).to have_content "Namecan't be blank"
    expect(page).to have_content "Passwordcan't be blank"
  end

end
