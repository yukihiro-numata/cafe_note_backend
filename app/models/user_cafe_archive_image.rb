# == Schema Information
#
# Table name: user_cafe_archive_images
#
#  id                   :bigint           not null, primary key
#  image_path           :string(255)      not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_cafe_archive_id :bigint           not null
#
# Indexes
#
#  index_user_cafe_archive_images_on_user_cafe_archive_id  (user_cafe_archive_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_cafe_archive_id => user_cafe_archives.id)
#
class UserCafeArchiveImage < ApplicationRecord
  belongs_to :user_cafe_archive
end
