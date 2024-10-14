class AddJtiToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :jti, :string, null: false
    add_index :customers, :jti, unique: true
  end
end
