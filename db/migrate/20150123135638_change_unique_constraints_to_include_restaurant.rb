class ChangeUniqueConstraintsToIncludeRestaurant < ActiveRecord::Migration
  def up
    remove_index :modifications, :name
    remove_index :items, :name
    add_index :employees, [:name, :restaurant_id], unique: true
    add_index :modifications, [:name, :restaurant_id], unique: true
    add_index :items, [:name, :restaurant_id], unique: true
  end

  def down
    remove_index :employees, [:name, :restaurant_id]
    remove_index :modifications, [:name, :restaurant_id]
    remove_index :items, [:name, :restaurant_id]
    add_index :modifications, :name, unique: true
    add_index :items, :name, unique: true
  end
end
