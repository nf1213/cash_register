require "rails_helper"

feature "Manager creates and employee spec" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @employee = FactoryGirl.build(:employee)
  end

  scenario "Manager must be a signed in as a manager" do
    employee = FactoryGirl.create(:employee)

    sign_in_as(employee)

    visit root_path
    expect(page).not_to have_content "Manager Functions"
    visit new_employee_path
    expect(page).to have_content "You are not authorized for this"
  end

  scenario "Manager provides valid information" do
    manager = FactoryGirl.create(:employee, status: "Manager")

    sign_in_as(manager)

    visit new_employee_path

    fill_in "Name", with: @employee.name
    fill_in "Password", with: @employee.password
    select @employee.status, from: "Status"

    click_on "Create"

    expect(page).to have_content "New employee created: #{@employee.name}"

  end

  scenario "Manager provides invalid information" do
    manager = FactoryGirl.create(:employee, status: "Manager")

    sign_in_as(manager)

    visit new_employee_path

    click_on "Create"

    expect(page).to have_content "Name can't be blank"
  end

end
