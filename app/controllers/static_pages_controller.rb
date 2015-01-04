class StaticPagesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager, only: [:manager_functions]

  def manager_functions

  end
end
