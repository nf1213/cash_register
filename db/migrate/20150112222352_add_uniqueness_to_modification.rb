class AddUniquenessToModification < ActiveRecord::Migration
  def change
    add_index :modifications, :name, unique: true
  end
end
