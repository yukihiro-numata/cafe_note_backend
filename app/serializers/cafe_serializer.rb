# == Schema Information
#
# Table name: cafes
#
#  id               :bigint           not null, primary key
#  business_hours   :string(255)      not null
#  can_smoking      :boolean          not null
#  can_takeout      :boolean          not null
#  has_parking      :boolean          not null
#  has_power_supply :boolean          not null
#  has_wifi         :boolean          not null
#  img_path         :string(255)      not null
#  name             :string(255)      not null
#  nearest_station  :string(255)      not null
#  regular_holiday  :string(255)      not null
#  transportation   :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class CafeSerializer < ActiveModel::Serializer
  attributes(*Cafe.attribute_names.map(&:to_sym))
  attributes :cafe_address
  attributes :cafe_media

  def cafe_address
    object.cafe_address
  end

  def cafe_media
    object.cafe_media
  end
end
