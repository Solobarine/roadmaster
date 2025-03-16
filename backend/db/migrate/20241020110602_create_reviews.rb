class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :rating
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
