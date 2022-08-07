class CreateCafeMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_media do |t|
      t.references :cafe, null: false, foreign_key: true
      t.integer :media_type, null: false, limit: 1
      t.text :url, null: false
      t.timestamps
    end
  end
end
