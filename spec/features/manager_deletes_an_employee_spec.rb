require "rails_helper"

feature "Mangaer deletes an employee" do

  before(:each) do
    FactoryGirl.create(:restaurant)
    @manager = FactoryGirl.create(:employee, status:"Manager")
  end

  scenario "must be a manager" do
    employee = FactoryGirl.create(:employee)
    sign_in_as(employee)

    visit employees_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "can't delete themselves" do
    sign_in_as(@manager)

    visit edit_employee_path(@manager)

    expect(page).to_not have_content "Delete"
  end

  scenario "deletes an employee" do
    employee = FactoryGirl.create(:employee)
    sign_in_as(@manager)

    visit employees_path
    click_on employee.name

    click_on "Delete"

    expect(page).to_not have_content employee.name
    expect(page).to have_content "Employee deleted"
  end

end
