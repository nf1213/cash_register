class AddCurrentToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :current, :boolean, default: true
  end
end
