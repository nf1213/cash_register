require "rails_helper"

feature "Manager updates an employee's salary" do

  before(:each) do
    FactoryGirl.create(:restaurant)
    @manager = FactoryGirl.create(:employee, status: "Manager")
    @employee = FactoryGirl.create(:employee)
    sign_in_as(@manager)
  end

  scenario "provides a valid number" do
    visit edit_employee_path(@employee)

    fill_in "Salary", with: 10.00
    select "Manager", from: "Status"

    click_on "Update"

    expect(page).to have_content "Employee updated"
  end

  scenario "provides invalid input" do
    visit edit_employee_path(@manager)

    fill_in "Salary", with: ""

    click_on "Update"

    expect(page).to have_content "Salary must be a number higher than $8.00"
  end

end
