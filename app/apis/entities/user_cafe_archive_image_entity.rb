module Entities
  class UserCafeArchiveImageEntity < BaseEntity
    expose :id, expose_nil: false
    expose :user_cafe_archive_id, expose_nil: false
    expose :image_path, expose_nil: false
  end
end
