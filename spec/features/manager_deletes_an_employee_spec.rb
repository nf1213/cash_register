require "rails_helper"

feature "Mangaer deletes an employee" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(@restaurant)
    @manager = FactoryGirl.create(:manager, restaurant: @restaurant)
  end

  scenario "must be a manager" do
    employee = FactoryGirl.create(:employee, restaurant: @restaurant)
    sign_in_as(employee)

    visit employees_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "can't delete themselves" do
    sign_in_as(@manager)

    visit employees_path
    click_on @manager.name

    expect(page).to_not have_content "Delete"
  end

  scenario "deletes an employee" do
    employee = FactoryGirl.create(:employee, restaurant: @restaurant)
    sign_in_as(@manager)

    visit employees_path
    click_on employee.name

    click_on "Delete"

    expect(page).to_not have_content employee.name
    expect(page).to have_content "Employee deleted"
  end

end
