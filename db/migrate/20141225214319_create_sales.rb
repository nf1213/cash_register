class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :total, default: 0
      t.integer :discount, default: 0

      t.timestamps
    end
  end
end
