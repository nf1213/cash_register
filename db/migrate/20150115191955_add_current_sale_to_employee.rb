class AddCurrentSaleToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :current_sale, :integer
  end
end
