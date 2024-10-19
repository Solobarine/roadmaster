class CreateManufacturers < ActiveRecord::Migration[7.1]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :country
      t.integer :founded_year
      t.timestamps
    end
  end
end
