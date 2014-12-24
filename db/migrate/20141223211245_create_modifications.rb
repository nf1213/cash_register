class CreateModifications < ActiveRecord::Migration
  def change
    create_table :modifications do |t|
      t.integer :item_id, null: false
      t.integer :mod_id, null: false
      t.timestamps
    end
  end
end
