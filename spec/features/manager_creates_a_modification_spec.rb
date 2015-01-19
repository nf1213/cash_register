require "rails_helper"

feature "Manager creates a modification" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
  end

  scenario 'must be a manager' do
    employee = FactoryGirl.create(:employee)
    sign_in_as(employee)

    visit new_modification_path
    expect(page).to have_content "You are not authorized for this"
  end

  scenario "provides a valid name" do
    manager = FactoryGirl.create(:employee, status:"Manager")
    sign_in_as(manager)

    modification = FactoryGirl.build(:modification)

    visit new_modification_path

    fill_in "Name", with: modification.name

    click_on "Create"

    expect(page).to have_content "New modification created"
  end

  scenario "provides an invalid name" do
    manager = FactoryGirl.create(:employee, status:"Manager")
    sign_in_as(manager)

    existing = FactoryGirl.create(:modification)

    visit new_modification_path

    click_on "Create"

    expect(page).to have_content "Namecan't be blank"

    fill_in "Name", with: existing.name

    click_on "Create"

    expect(page).to have_content "Namehas already been taken"
  end
end
