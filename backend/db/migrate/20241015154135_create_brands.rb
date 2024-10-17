class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.references :manufacturer, foreign_key: true
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
