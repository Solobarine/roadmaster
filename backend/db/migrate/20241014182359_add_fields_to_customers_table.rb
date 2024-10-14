class AddFieldsToCustomersTable < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :phone, :string, null: true
    add_column :customers, :address, :string, null: true
    add_column :customers, :city, :string, null: true
    add_column :customers, :state, :string, null: true
    add_column :customers, :zip_code, :string, null: true
  end
end
