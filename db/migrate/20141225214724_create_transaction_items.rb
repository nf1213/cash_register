class CreateTransactionItems < ActiveRecord::Migration
  def change
    create_table :transaction_items do |t|
      t.integer :transaction_id, null: false
      t.integer :item_id, null: false
      t.timestamps
    end
  end
end
