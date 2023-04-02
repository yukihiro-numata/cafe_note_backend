module Entities
  class CafeAddressEntity < BaseEntity
    expose :id, expose_nil: false
    expose :cafe_id, expose_nil: false
    expose :post_code, expose_nil: false
    expose :prefecture, expose_nil: false
    expose :city, expose_nil: false
    expose :address, expose_nil: false
    expose :building, expose_nil: true
  end
end
