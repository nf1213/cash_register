require "rails_helper"

feature "Manager views sale data" do

  before(:each) do
    FactoryGirl.create(:restaurant)
    @manager = FactoryGirl.create(:employee, status: "Manager")
    @sale_item = FactoryGirl.create(:sale_item)
  end

  scenario "must be a manager" do
    employee = FactoryGirl.create(:employee)
    sign_in_as(employee)

    visit sales_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "clears all sale data" do
    sign_in_as(@manager)

    visit sales_path

    expect(page).to have_content @sale_item.item.name
    expect(page).to have_content "#{@sale_item.item.name}: 1 sold"

    click_on "Clear Data"

    expect(page).to have_content "Sales Destroyed"
    expect(page).to have_content "#{@sale_item.item.name}: 0 sold"
  end

end
