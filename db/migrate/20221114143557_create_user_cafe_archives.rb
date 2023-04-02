class CreateUserCafeArchives < ActiveRecord::Migration[6.1]
  def change
    create_table :user_cafe_archives do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cafe, null: false, foreign_key: true
      t.integer :rating, null: false, limit: 5
      t.text :memo, null: false
      t.date :visited_date, null: false
      t.timestamps
    end
  end
end
