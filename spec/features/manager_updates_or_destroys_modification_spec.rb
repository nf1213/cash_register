require "rails_helper"

feature "Manager updates or destroys a modification" do

  before(:each) do
    FactoryGirl.create(:restaurant)
    @manager = FactoryGirl.create(:employee, status: "Manager")
    @modification = FactoryGirl.create(:modification)
  end

  scenario "must be a manager" do
    employee = FactoryGirl.create(:employee)
    sign_in_as(employee)

    visit edit_modification_path(@modification)

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "updates with valid attributes" do
    sign_in_as(@manager)
    visit edit_modification_path(@modification)

    fill_in "Name", with: "Cheese"
    fill_in "Price", with: "0.25"
    fill_in "Limit", with: 1

    click_on "Update"

    expect(page).to have_content "Modification Updated"
  end

  scenario "updates with invalid attributes" do
    sign_in_as(@manager)
    visit edit_modification_path(@modification)

    fill_in "Name", with: ""
    fill_in "Limit", with: ""

    click_on "Update"

    expect(page).to have_content "Namecan't be blank"
    expect(page).to have_content "Limitis not a number"
  end

  scenario "deletes modification" do
    sign_in_as(@manager)
    visit edit_modification_path(@modification)

    click_on "Delete"
    expect(page).to have_content "Modification destroyed"

    visit modifications_path
    expect(page).to_not have_content @modification.name
  end

end
