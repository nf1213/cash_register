class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :employee_id, null: false
      t.datetime :clock_in
      t.datetime :clock_out
    end
  end
end
