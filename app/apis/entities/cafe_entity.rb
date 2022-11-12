module Entities
  class CafeEntity < Grape::Entity
    expose :id
    expose :name
    expose :nearest_station
    expose :transportation
    expose :business_hours
    expose :regular_holiday
    expose :can_takeout
    expose :has_parking
    expose :has_wifi
    expose :has_power_supply
    expose :can_smoking
    expose :img_path
    expose :cafe_address, using: Entities::CafeAddressEntity
    expose :cafe_media, using: Entities::CafeMediaEntity
  end
end
