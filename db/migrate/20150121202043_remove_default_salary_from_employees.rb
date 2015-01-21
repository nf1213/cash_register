class RemoveDefaultSalaryFromEmployees < ActiveRecord::Migration
  def change
    change_column_default(:employees, :salary, nil)
  end
end
