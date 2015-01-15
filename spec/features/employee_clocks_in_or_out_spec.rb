require "rails_helper"

feature "Employee clocks in or out" do

  before(:each) do
    FactoryGirl.create(:restaurant)
  end

  scenario "successfully clocks in and out" do
    employee = FactoryGirl.create(:employee)

    visit employees_clock_in_out_path
  end

  scenario "provides invalid credentials" do

  end

  scenario "tries to clock out while signed in" do

  end

end
