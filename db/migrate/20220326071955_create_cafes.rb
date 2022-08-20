class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name, null: false
      t.string :nearest_station, null: false
      t.string :transportation, null: false
      # 営業時間（曜日によって変わることがある）
      t.string :business_hours, null: false
      # 定休日（曜日固定の場合と日付固定の場合がある）
      t.string :regular_holiday, null: false
      t.boolean :can_takeout, null: false
      t.boolean :has_parking, null: false
      t.boolean :has_wifi, null: false
      t.boolean :has_power_supply, null: false
      t.boolean :can_smoking, null: false
      t.string :img_path, null: false
      t.timestamps
    end
  end
end
