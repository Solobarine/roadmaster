class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name
      t.integer :year
      t.string :body_type
      t.string :engine_type
      t.string :fuel_type
      t.string :transmission
      t.string :drivetrain
      t.integer :horsepower
      t.integer :torque
      t.integer :seating_capacity
      t.decimal :cargo_capacity, precision: 10, scale: 2
      t.decimal :fuel_economy_city, precision: 5, scale: 2
      t.decimal :fuel_economy_highway, precision: 5, scale: 2
      t.decimal :safety_rating, precision: 3, scale: 1
      t.decimal :msrp, precision: 10, scale: 2
      t.string :vin
      t.string :trim_level
      t.string :exterior_color
      t.string :interior_color
      t.integer :mileage
      t.string :condition
      t.text :features
      t.string :registration_state
      t.date :registration_expiry
      t.string :warranty_status
      t.decimal :price
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end
