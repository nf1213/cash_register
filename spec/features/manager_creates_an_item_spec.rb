require 'rails_helper'

feature 'Manager creates an item' do

  before(:each) do
    @restaurant = factory_for_restaurant
    sign_in_restaurant(@restaurant)
    @item = FactoryGirl.build(:item)
  end

  scenario 'must be a manager' do
    employee = factory_for_employee(@restaurant)
    sign_in_as(employee)

    visit root_path
    expect(page).not_to have_content "Manager Functions"
    visit new_item_path
    expect(page).to have_content "You are not authorized for this"
  end

  scenario 'fills out the form with valid attributes' do
    employee = factory_for_manager(@restaurant)
    sign_in_as(employee)

    visit root_path

    click_on "Manager Functions"
    click_on "New Item"

    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price

    click_on "Create Item"

    expect(page).to have_item_button @item

  end

  scenario 'sees errors if no info is provided' do
    employee = factory_for_manager(@restaurant)
    sign_in_as(employee)

    visit new_item_path

    click_on "Create Item"

    expect(page).to have_content "Namecan't be blank"
    expect(page).to have_content "Pricemust be greater than $0.00"

  end

  scenario 'sees errors if item already exists' do
    item = FactoryGirl.create(:item, restaurant: @restaurant)
    employee = factory_for_manager(@restaurant)
    sign_in_as(employee)

    visit new_item_path

    fill_in 'Name', with: item.name
    fill_in 'Price', with: item.price

    click_on "Create Item"

    expect(page).to have_content "Namehas already been taken"
  end

end
