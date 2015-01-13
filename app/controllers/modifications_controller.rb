class ModificationsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager

  def new
    @modification = Modification.new
  end

  def create
    @modification = Modification.new(modification_params)
    if @modification.save
      redirect_to static_pages_manager_functions_path, notice: "New modification created"
    else
      render :new
    end
  end

  private

  def modification_params
    params.require(:modification).permit(:name)
  end
end
