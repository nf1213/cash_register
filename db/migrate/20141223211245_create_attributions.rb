class CreateAttributions < ActiveRecord::Migration
  def change
    create_table :attributions do |t|
      t.integer :item_id, null: false
      t.integer :attribute_id, null: false
      t.timestamps
    end
  end
end
