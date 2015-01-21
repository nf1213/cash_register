class AddDefaultToSalary < ActiveRecord::Migration
  def change
    change_column_default(:employees, :salary, 800)
  end
end
