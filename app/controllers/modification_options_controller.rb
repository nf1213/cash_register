class ModificationOptionsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager

  def new
    @modification_option = ModificationOption.new
  end

  def inverse_new
    @modification_option = ModificationOption.new
  end

  def create
    modifications = params[:modification_option][:modification_ids]
    modifications.delete("")
    item = params[:modification_option][:item]
    if modifications.empty?
      redirect_to new_modification_option_path, alert: "Please select some modifications for your item"
    else
      modifications.each do |m|
        @modification_option = ModificationOption.new(item_id: item, modification_id: m, restaurant_id: current_restaurant.id)
        @modification_option.save
      end
      redirect_to static_pages_manager_functions_path, notice: "Modification Options Saved"
    end
  end

  def inverse_create
    items = params[:modification_option][:item_ids]
    items.delete("")
    modification = params[:modification_option][:modification]
    if items.empty?
      redirect_to modification_options_inverse_new_path, alert: "Please select some items to add this modification to"
    else
      items.each do |i|
        @modification_option = ModificationOption.new(item_id: i, modification_id: modification, restaurant_id: current_restaurant.id)
        @modification_option.save
      end
      redirect_to static_pages_manager_functions_path, notice: "Modification Options Saved"
    end
  end
end
