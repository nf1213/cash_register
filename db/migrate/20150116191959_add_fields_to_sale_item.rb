class AddFieldsToSaleItem < ActiveRecord::Migration
  def change
    add_column :sale_items, :name, :string
    add_column :sale_items, :price, :integer
  end
end
