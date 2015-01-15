class AddShiftToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :current_shift, :integer
  end
end
