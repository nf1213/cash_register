class AddCountToSaleItemModification < ActiveRecord::Migration
  def change
    add_column :sale_item_modifications, :current_count, :integer, default: 0
  end
end
