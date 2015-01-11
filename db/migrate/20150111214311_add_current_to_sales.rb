class AddCurrentToSales < ActiveRecord::Migration
  def change
    add_column :sales, :current, :boolean, default: true
  end
end
