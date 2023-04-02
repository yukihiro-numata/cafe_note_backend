module Entities
  class UserCafeArchiveEntity < BaseEntity
    expose :id
    expose :cafe_id
    expose :rating
    expose :memo
    expose :visited_date
    expose :user_cafe_archive_images, using: Entities::UserCafeArchiveImageEntity
  end
end
