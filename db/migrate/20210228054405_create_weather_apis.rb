class CreateWeatherApis < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_apis do |t|
      t.date :dated_on, null: false
      t.integer :weather_id, null: false
      t.string :weather, null: false
      t.string :weather_icon, null: false
      t.float :temperature, null: false

      t.timestamps
    end
  end
end
