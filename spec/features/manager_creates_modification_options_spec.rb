require "rails_helper"

feature "Manager creates modification options" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    sign_in_restaurant(@restaurant)
    @item = FactoryGirl.create(:item, restaurant: @restaurant)
    @item2 = FactoryGirl.create(:item, restaurant: @restaurant)
    @modification = FactoryGirl.create(:modification, restaurant: @restaurant)
    @modification2 = FactoryGirl.create(:modification, restaurant: @restaurant)
  end

  scenario 'must be a manager' do
    employee = FactoryGirl.create(:employee, restaurant: @restaurant)
    sign_in_as(employee)

    visit new_modification_path
    expect(page).to have_content "You are not authorized for this"
  end

  scenario 'successfully adds multiple options to an item' do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)
    sign_in_as(manager)

    visit new_modification_option_path
    select @item.name, from: "Item"
    check_modification_box(@modification)
    check_modification_box(@modification2)

    click_on "Create Options"
    expect(page).to have_content "Modification Options Saved"
  end

  scenario 'does not provide any modifications to add' do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)
    sign_in_as(manager)

    visit new_modification_option_path

    click_on "Create Options"
    expect(page).to have_content "Please select some options"
  end

  scenario 'successfully adds an option to multiple items' do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)
    sign_in_as(manager)

    visit modification_options_inverse_new_path
    select @modification.name, from: "Modification"
    check_item_box(@item)
    check_item_box(@item2)

    click_on "Create Options"
    expect(page).to have_content "Modification Options Saved"
  end

  scenario 'does not provide any items to add modifications to' do
    manager = FactoryGirl.create(:manager, restaurant: @restaurant)
    sign_in_as(manager)

    visit modification_options_inverse_new_path

    click_on "Create Options"
    expect(page).to have_content "Please select some options"
  end

end
