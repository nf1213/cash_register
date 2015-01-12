class CreateModifications < ActiveRecord::Migration
  def change
    create_table :modifications do |t|
      t.string :name, null: false
      t.integer :price

      t.timestamps
    end
  end
end
