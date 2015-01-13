class AddUniquenessToModificationOptions < ActiveRecord::Migration
  def change
    add_index :modification_options, [:item_id, :modification_id], unique: true
  end
end
