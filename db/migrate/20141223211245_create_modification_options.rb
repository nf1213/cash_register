class CreateModificationOptions < ActiveRecord::Migration
  def change
    create_table :modification_options do |t|
      t.integer :item_id, null: false
      t.integer :modification_id, null: false
      t.timestamps
    end
  end
end
