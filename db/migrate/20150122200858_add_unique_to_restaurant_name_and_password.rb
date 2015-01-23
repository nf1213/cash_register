class AddUniqueToRestaurantNameAndPassword < ActiveRecord::Migration
  def change
    add_index :restaurants, :name, unique: true
    add_column :restaurants, :encrypted_password, :string
    add_column :restaurants, :salt, :string
  end
end
