class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name, null: false
      t.integer :price

      t.timestamps
    end
  end
end
