require 'rails_helper'

feature 'User visits homepage' do
  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @item = FactoryGirl.create(:item)
    @employee = FactoryGirl.create(:employee)
    sign_in_as(@employee)
  end

  scenario 'Sees the title of the website' do
    visit items_path
    expect(page).to have_content @restaurant.name
  end

  scenario 'Sees the names of the items' do
    visit items_path
    expect(page).to have_content @item.name
  end

end
