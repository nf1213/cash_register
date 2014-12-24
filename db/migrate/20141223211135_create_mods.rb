class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.string :name, null: false
      t.integer :price

      t.timestamps
    end
  end
end
