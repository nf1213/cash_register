require "rails_helper"

feature "User is created" do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @manager = FactoryGirl.create(:employee, status: "Manager")
    @employee = FactoryGirl.build(:employee)
  end

  scenario "Manager can create a user with valid attributes" do

  end

  scenario "Manager cannot create a user without attributes" do

  end

  scenario "Manager cannot create an employee with the same name as an existing employee" do

  end

end
