require 'rails_helper'

feature 'Manager creates a mod or modification' do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
    @employee = FactoryGirl.create(:employee, status: "Manager")
    sign_in_as(@employee)
  end

  scenario "Manager can add a new mod from manager functions page" do

  end

  scenario "Manager cannot add mod if form is not properly filled out" do

  end

end