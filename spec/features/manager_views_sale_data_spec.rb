require "rails_helper"

feature "Manager views sale data" do

  before(:each) do
    @restaurant = factory_for_restaurant
    sign_in_restaurant(@restaurant)
    @manager = factory_for_manager(@restaurant)
    sale = FactoryGirl.create(:sale, employee: @manager, restaurant: @restaurant)
    item = FactoryGirl.create(:item, restaurant: @restaurant)
    @sale_item = SaleItem.create(restaurant: @restaurant,  sale: sale, item: item, name: item.name, price: item.price)
  end

  scenario "must be a manager" do
    employee = factory_for_employee(@restaurant)
    sign_in_as(employee)

    visit sales_path

    expect(page).to have_content "You are not authorized for this"
  end

  scenario "clears all sale data" do
    sign_in_as(@manager)

    visit sales_path

    expect(page).to have_content @sale_item.item.name
    expect(page).to have_content "#{@sale_item.item.name}: 1 sold"

    click_on "Clear Data"

    expect(page).to have_content "Sales Destroyed"
    expect(page).to have_content "#{@sale_item.item.name}: 0 sold"
  end

end
