require 'rails_helper'

feature 'Employee completes a transaction' do
  before(:each) do
    @restaurant = factory_for_restaurant
    sign_in_restaurant(@restaurant)
    @employee = factory_for_employee(@restaurant)
    sign_in_as(@employee)
    @item = FactoryGirl.create(:item, restaurant: @restaurant)
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

  scenario 'Item can be cancelled if customer no longer wants it' do
    visit root_path
    click_on @item.name
    total = (@item.price) / 100.00
    expect(page).to have_content("Total: #{sprintf('$%.2f', total)}")
    click_on "X"
    expect(page).to have_content("Item voided")
    expect(page).to_not have_content("Total: ")
  end

  scenario 'Sale can be cancelled' do
    visit root_path
    click_on @item.name
    click_on "Cancel"
    expect(page).to have_content("Transaction cancelled")
  end
end
