class CreateSaleItemModifications < ActiveRecord::Migration
  def change
    create_table :sale_item_modifications do |t|
      t.integer :sale_item_id, null: false
      t.integer :modification_id, null: false

      t.timestamps
    end
  end
end
