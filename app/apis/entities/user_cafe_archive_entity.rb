module Entities
  class UserCafeArchiveEntity < BaseEntity
    expose :id
    expose :cafe_id
    expose :rating
    expose :memo
    expose :visited_at, format_with: :iso_timestamp
    expose :user_cafe_archive_images, using: Entities::UserCafeArchiveImageEntity
  end
end
