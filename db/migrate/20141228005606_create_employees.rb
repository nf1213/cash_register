class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
