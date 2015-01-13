class ModificationOptionsController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager

  def new
    @modification_option = ModificationOption.new
  end

  def create
    modifications = params[:modification_option][:modification_ids]
    modifications.delete("")
    item = params[:modification_option][:item]
    if modifications.empty?
      redirect_to new_modification_option_path, notice: "Please select some modifications for your item"
    else
      modifications.each do |m|
        @modification_option = ModificationOption.new(item_id: item, modification_id: m)
        @modification_option.save
      end
      redirect_to static_pages_manager_functions_path, notice: "Modification Options Saved"
    end
  end

  private

  def modification_option_params
    params.require(:modification_option).permit(:item, :modification_id)
  end
end
