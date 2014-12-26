require 'rails_helper'

feature 'User visits homepage' do
  item = FactoryGirl.create(:item)
  scenario 'Sees the title of the website' do
    visit items_path
    expect(page).to have_content 'NAME OF RESTAURANT'
  end

  scenario 'Sees the names of the items' do
    visit items_path
    expect(page).to have_content item.name
  end

end
