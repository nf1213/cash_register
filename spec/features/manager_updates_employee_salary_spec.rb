require "rails_helper"

feature "Manager updates an employee's salary" do

  before(:each) do
    FactoryGirl.create(:restaurant)
    @manager = FactoryGirl.create(:employee, status: "Manager")
    @employee = FactoryGirl.create(:employee)
  end

  scenario "must be a manager" do
    sign_in_as(@employee)

    visit edit_employee_path(@manager)

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "provides a valid number" do
    sign_in_as(@manager)
    visit edit_employee_path(@employee)

    fill_in "Salary", with: 10.00
    select "Manager", from: "Status"

    click_on "Update"

    expect(page).to have_content "Employee updated"
  end

  scenario "provides invalid input" do
    sign_in_as(@manager)
    visit edit_employee_path(@manager)

    fill_in "Salary", with: ""

    click_on "Update"

    expect(page).to have_content "must be greater than $0.00"
  end

end
