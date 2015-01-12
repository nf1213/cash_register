require "rails_helper"

feature "Manager creates a modification" do

  scenario "provides a valid name" do
    modification = FactoryGirl.build(:modification)

    visit new_modification_path

    fill_in "Name", with: modification.name

    click_on "Create Modification"

    expect(page).to have_content "New modification created"
  end

  scenario "provides an invalid name" do
    existing = FactoryGirl.create(:modification)

    visit new_modification_path

    click_on "Create Modification"

    expect(page).to have_content "Name can't be blank"

    fill_in "Name", with: existing.name

    click_on "Create Modification"

    expect(page).to have_content "Name has already been taken"
  end
end
