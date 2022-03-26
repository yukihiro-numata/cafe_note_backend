class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.string :nearest_station
      t.string :transportation
      t.string :business_hours
      t.string :regular_holiday
      t.boolean :can_takeout
      t.boolean :has_parking
      t.boolean :has_wifi
      t.boolean :has_power_supply
      t.boolean :can_smoking
      t.string :memo
      t.string :tabelog_url
      t.timestamps
    end
  end
end
