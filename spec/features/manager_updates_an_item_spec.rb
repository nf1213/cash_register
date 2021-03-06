require "rails_helper"

feature "Manager updates an item" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(@restaurant)
    @manager = FactoryGirl.create(:manager, restaurant: @restaurant)
    @item = FactoryGirl.create(:item, restaurant: @restaurant)
  end

  scenario "must be a manager" do
    visit edit_item_path(@item)
    expect(page).to have_content "Please Sign In"
    employee = FactoryGirl.create(:employee, restaurant: @restaurant)
    sign_in_as(employee)
    visit edit_item_path(@item)
    expect(page).to have_content "You are not authorized for this"
  end

  scenario "changes an item's price" do
    sign_in_as(@manager)
    visit edit_item_path(@item)

    fill_in "Price", with: "11.00"

    click_on "Update"

    expect(page).to have_content "Item Updated"
  end

  scenario "changes an item's name" do
    sign_in_as(@manager)
    visit edit_item_path(@item)

    fill_in "Name", with: "Factory Girl's Pizza"

    click_on "Update"

    expect(page).to have_content "Item Updated"
    expect(page).to have_content "Factory Girl's Pizza"
  end

  scenario "enters an invalid price" do
    sign_in_as(@manager)
    visit edit_item_path(@item)

    fill_in "Price", with: ""

    click_on "Update"

    expect(page).to have_content "must be greater than $0.00"
  end

  scenario "deletes an item" do
    sign_in_as(@manager)
    visit edit_item_path(@item)

    click_on "Delete"

    expect(page).to have_content "Item Deleted"
  end

end
