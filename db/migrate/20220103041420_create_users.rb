class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :tel
      t.string :email, null: true
      t.timestamps
    end
  end
end
