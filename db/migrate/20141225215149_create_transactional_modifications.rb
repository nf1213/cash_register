class CreateTransactionalModifications < ActiveRecord::Migration
  def change
    create_table :transactional_modifications do |t|
      t.integer :transaction_item_id, null: false
      t.integer :modification_id, null: false

      t.timestamps
    end
  end
end
