module Entities
  class CafeMediaEntity < Grape::Entity
    expose :id
    expose :cafe_id
    expose :media_type
    expose :url
  end
end
