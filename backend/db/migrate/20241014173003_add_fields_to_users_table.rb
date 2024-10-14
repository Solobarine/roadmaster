class AddFieldsToUsersTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :position, :string
    add_column :users, :hire_date, :date
  end
end
