require "rails_helper"

feature "Manager updates an employee's salary" do

  before(:each) do
    FactoryGirl.create(:restaurant)
    @manager = factory_for_manager
    @employee = factory_for_employee
  end

  scenario "must be a manager" do
    sign_in_as(@employee)

    visit employees_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "provides a valid number" do
    sign_in_as(@manager)
    visit employees_path
    click_on @employee.name

    fill_in "Salary", with: 10.00
    select "Manager", from: "Status"

    click_on "Update"

    expect(page).to have_content "Employee updated"
  end

  scenario "provides invalid input" do
    sign_in_as(@manager)
    visit employees_path
    click_on @employee.name

    fill_in "Salary", with: ""

    click_on "Update"

    expect(page).to have_content "Salarymust be greater than $0.00"
  end

end
