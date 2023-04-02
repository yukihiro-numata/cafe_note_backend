module Entities
  class UserCafeArchiveEntity < BaseEntity
    expose :id, expose_nil: false
    expose :cafe_id, expose_nil: false
    expose :rating, expose_nil: false
    expose :memo, expose_nil: true
    expose :visited_date, expose_nil: false
    expose :user_cafe_archive_images, using: Entities::UserCafeArchiveImageEntity, expose_nil: true
  end
end
