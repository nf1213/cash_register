class AddRestaurantIdToAllTables < ActiveRecord::Migration
  def change
    add_column :items, :restaurant_id, :integer, default: 2
    add_column :modification_options, :restaurant_id, :integer, default: 2
    add_column :modifications, :restaurant_id, :integer, default: 2
    add_column :sale_item_modifications, :restaurant_id, :integer, default: 2
    add_column :sale_items, :restaurant_id, :integer, default: 2
    add_column :sales, :restaurant_id, :integer, default: 2
    add_column :shifts, :restaurant_id, :integer, default: 2
  end
end
