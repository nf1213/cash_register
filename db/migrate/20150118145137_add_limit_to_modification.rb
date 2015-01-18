class AddLimitToModification < ActiveRecord::Migration
  def change
    add_column :modifications, :limit, :integer, default: 5, null: false
  end
end
