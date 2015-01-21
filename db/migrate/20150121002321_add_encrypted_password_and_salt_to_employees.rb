class AddEncryptedPasswordAndSaltToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :encrypted_password, :string
    add_column :employees, :salt, :string
    remove_column :employees, :password, :string
  end
end
