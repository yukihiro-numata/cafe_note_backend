module Entities
  class CafeEntity < BaseEntity
    expose :id, expose_nil: false
    expose :name, expose_nil: false
    expose :nearest_station, expose_nil: false
    expose :transportation, expose_nil: false
    expose :business_hours, expose_nil: false
    expose :regular_holiday, expose_nil: false
    expose :can_takeout, expose_nil: false
    expose :has_parking, expose_nil: false
    expose :has_wifi, expose_nil: false
    expose :has_power_supply, expose_nil: false
    expose :can_smoking, expose_nil: false
    expose :img_path, expose_nil: false
    expose :cafe_address, using: Entities::CafeAddressEntity, expose_nil: false
    expose :cafe_media, using: Entities::CafeMediaEntity, expose_nil: false
  end
end
