class CreateUserCafeArchiveImages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_cafe_archive_images do |t|
      t.references :user_cafe_archive, null: false, foreign_key: true
      t.string :image_path, null: false
      t.timestamps
    end
  end
end
