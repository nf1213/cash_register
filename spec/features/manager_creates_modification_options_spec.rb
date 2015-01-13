require "rails_helper"

feature "Manager creates modification options" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @item = FactoryGirl.create(:item)
    @modification = FactoryGirl.create(:modification)
    @modification2 = FactoryGirl.create(:modification)
  end

  scenario 'must be a manager' do
    employee = FactoryGirl.create(:employee)
    sign_in_as(employee)

    visit new_modification_path
    expect(page).to have_content "You are not authorized for this"
  end

  scenario 'successfully adds multiple options to an item' do
    manager = FactoryGirl.create(:employee, status:"Manager")
    sign_in_as(manager)

    visit new_modification_option_path
    select @item.name, from: "Item"
    check_modification_box(@modification)
    check_modification_box(@modification2)

    click_on "Create Options"
    expect(page).to have_content "Modification Options Saved"

    visit item_path(@item)
    expect(page).to have_content @modification.name
    expect(page).to have_content @modification2.name
  end

  scenario 'does not provide any modifications to add' do
    manager = FactoryGirl.create(:employee, status:"Manager")
    sign_in_as(manager)

    visit new_modification_option_path

    click_on "Create Options"
    expect(page).to have_content "Please select some modifications for your item"
  end

end
