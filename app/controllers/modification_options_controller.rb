class ModificationOptionsController < ApplicationController
  def new
    @modification_option = ModificationOption.new
  end

  def create
    modifications = params[:modification_option][:modification_ids]
    item = params[:modification_option][:item]
    if modifications.empty?
      render :new
    else
      modifications.each do |m|
        unless m == ""
          @modification_option = ModificationOption.new(item_id: item, modification_id: m)
          @modification_option.save
        end
      end
      redirect_to static_pages_manager_functions_path, notice: "Modification Options saved"
    end
  end

  private

  def modification_option_params
    params.require(:modification_option).permit(:item, :modification_id)
  end
end
