class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.decimal :lat, precision: 7, scale: 5, null: false
      t.decimal :lon, precision: 8, scale: 5, null: false

      t.timestamps
    end
  end
end
