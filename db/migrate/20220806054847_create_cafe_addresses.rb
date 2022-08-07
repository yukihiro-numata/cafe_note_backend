class CreateCafeAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :cafe_addresses do |t|
      t.references :cafe, null: false, foreign_key: true
      t.integer :post_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building, null: true
      t.timestamps
    end
  end
end
