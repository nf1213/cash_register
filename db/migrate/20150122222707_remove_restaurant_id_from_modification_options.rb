class RemoveRestaurantIdFromModificationOptions < ActiveRecord::Migration
  def change
    remove_column :modification_options, :restaurant_id, :integer
  end
end
