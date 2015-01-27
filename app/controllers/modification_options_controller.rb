class ModificationOptionsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager

  def new
    @modification_option = ModificationOption.new
    @options = current_restaurant.modifications
    @items = current_restaurant.items
  end

  def inverse_new
    @modification_option = ModificationOption.new
    @options = current_restaurant.modifications
    @items = current_restaurant.items
  end

  def create
    modifications = params[:modification_option][:modification_ids]
    item = params[:modification_option][:item]
    create_func(modifications, item, new_modification_option_path)
  end

  def inverse_create
    items = params[:modification_option][:item_ids]
    modification = params[:modification_option][:modification]
    create_func(items, modification, modification_options_inverse_new_path, true)
  end

  def create_func(arr, obj, path, inverse=false)
    arr.delete("")
    if arr.empty?
      redirect_to path, alert: "Please select some options"
    else
      arr.each do |a|
        if inverse
          @modification_option = ModificationOption.new(item_id: a, modification_id: obj)
        else
          @modification_option = ModificationOption.new(item_id: obj, modification_id: a)
        end
        @modification_option.save
      end
      redirect_to static_pages_manager_functions_path, notice: "Modification Options Saved"
    end
  end
end
