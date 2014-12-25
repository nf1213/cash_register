class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
