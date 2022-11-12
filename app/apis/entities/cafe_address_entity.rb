module Entities
  class CafeAddressEntity < Grape::Entity
    expose :id
    expose :cafe_id
    expose :post_code
    expose :prefecture
    expose :city
    expose :address
    expose :building
  end
end
