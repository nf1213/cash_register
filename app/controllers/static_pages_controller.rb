class StaticPagesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate

  def manager_functions

  end
end
