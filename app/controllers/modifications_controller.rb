class ModificationsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager

  def index
    @modifications = Modification.all
  end

  def edit
    @modification = Modification.find(params[:id])
  end

  def update
    @modification = Modification.find(params[:id])
    @modification.update(modification_params)
    price = params[:modification][:price].to_f * 100
    @modification.update(price: price)
    if @modification.save
      redirect_to modifications_path, notice: "Modification Updated"
    else
      render :edit
    end
  end

  def destroy
    @modification = Modification.find(params[:id]).destroy
    redirect_to modifications_path, notice: "Modification destroyed"
  end

  def new
    @modification = Modification.new
  end

  def create
    @modification = Modification.new(modification_params)
    price = params[:modification][:price].to_f * 100
    @modification.price = price
    if @modification.save
      redirect_to static_pages_manager_functions_path, notice: "New modification created"
    else
      render :new
    end
  end

  private

  def modification_params
    params.require(:modification).permit(:name, :price, :limit)
  end
end
