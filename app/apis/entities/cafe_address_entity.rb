module Entities
  class CafeAddressEntity < BaseEntity
    expose :id
    expose :cafe_id
    expose :post_code
    expose :prefecture
    expose :city
    expose :address
    expose :building
  end
end
