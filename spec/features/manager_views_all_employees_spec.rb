require "rails_helper"

feature "Manager views all employees" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(@restaurant)
  end

  scenario "must be manager" do
    visit employees_path

    expect(page).to have_content "Please Sign In"

    employee = FactoryGirl.create(:employee, restaurant: @restaurant)
    sign_in_as(employee)

    visit employees_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "sees all their names, passwords, and statuses" do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)
    employee1 = FactoryGirl.create(:employee, restaurant: @restaurant)
    employee2 = FactoryGirl.create(:employee, restaurant: @restaurant)
    sign_in_as(manager)

    visit employees_path

    expect(page).to have_content employee1.name
    expect(page).to have_content employee2.name
    expect(page).to have_content manager.name
    expect(page).to have_content employee2.status
  end

end
