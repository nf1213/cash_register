class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :sale_id, null: false
      t.integer :item_id, null: false
      t.integer :discount, default: 0
      t.timestamps
    end
  end
end
