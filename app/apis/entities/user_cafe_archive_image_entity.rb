module Entities
  class UserCafeArchiveImageEntity < Grape::Entity
    expose :id
    expose :user_cafe_archive_id
    expose :image_path
  end
end
