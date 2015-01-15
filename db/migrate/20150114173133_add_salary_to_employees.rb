class AddSalaryToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :integer, default: 800
  end
end
