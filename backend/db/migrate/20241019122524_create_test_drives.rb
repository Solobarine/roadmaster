class CreateTestDrives < ActiveRecord::Migration[7.1]
  def change
    create_table :test_drives do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.date :booking_date
      t.text :booking_time
      t.string :status, default: :pending
      t.text :notes

      t.timestamps
    end
  end
end
