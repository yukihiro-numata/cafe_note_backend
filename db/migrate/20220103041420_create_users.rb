class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firebase_uid, null: false
      t.string :email, null: false
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
