require 'rails_helper'

feature 'User visits homepage for the first time' do
  scenario 'Is welcomed and can create their restaurant' do
    restaurant = FactoryGirl.build(:restaurant)
    visit items_path
    expect(page).to have_content 'Welcome'

    fill_in "Name", with: restaurant.name
    click_on "Create Restaurant"

    expect(page).to have_content restaurant.name
  end
end
