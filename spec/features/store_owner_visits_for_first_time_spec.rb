require 'rails_helper'

feature 'Store owner visits homepage for the first time' do
  scenario 'Is welcomed and can create their restaurant' do
    restaurant = FactoryGirl.build(:restaurant)
    manager = FactoryGirl.build(:employee)
    visit root_path

    expect(page).to have_content 'Welcome'

    fill_in "Restaurant Name", with: restaurant.name
    fill_in "Store Owner Name", with: "Nicole"
    fill_in "Password", with: manager.password
    fill_in "Password confirmation", with: manager.password
    click_on "Create Restaurant"

    expect(page).to have_content restaurant.name
    expect(page).to have_content "Please Sign In"
  end

  scenario 'Does not fill out the form' do
    visit root_path

    click_on "Create Restaurant"

    expect(page).to have_content "Employees name can't be blank"
    expect(page).to have_content "Employees password can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end
