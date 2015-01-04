class AddSignedInToUsers < ActiveRecord::Migration
  def change
    add_column :employees, :signed_in, :boolean, :default => false
  end
end
