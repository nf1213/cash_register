require "rails_helper"

feature "Manager views all employees" do

  before(:each) do
    FactoryGirl.create(:restaurant)
  end

  scenario "must be manager" do
    visit employees_path

    expect(page).to have_content "Please Sign In"

    employee = factory_for_employee
    sign_in_as(employee)

    visit employees_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "sees all their names, passwords, and statuses" do
    manager = factory_for_manager
    employee1 = factory_for_employee
    employee2 = factory_for_employee2
    sign_in_as(manager)

    visit employees_path

    expect(page).to have_content employee1.name
    expect(page).to have_content employee2.name
    expect(page).to have_content manager.name
    expect(page).to have_content employee2.status
  end

end
