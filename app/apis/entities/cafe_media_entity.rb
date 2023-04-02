module Entities
  class CafeMediaEntity < BaseEntity
    expose :id, expose_nil: false
    expose :cafe_id, expose_nil: false
    expose :media_type, expose_nil: false
    expose :url, expose_nil: false
  end
end
