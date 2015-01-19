require 'rails_helper'

feature 'Employee completes a transaction' do
  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @employee = FactoryGirl.create(:employee)
    sign_in_as(@employee)
    @item = FactoryGirl.create(:item)
  end

  scenario 'Items are rung in and price is shown' do
    visit root_path
    click_on @item.name
    click_on "Done"

    total = (@item.price) / 100.00
    expect(page).to have_content("Total: #{sprintf('$%.2f', total)}")

    click_on "Cash Out"
    expect(page).to_not have_content("Total: ")
  end
end
