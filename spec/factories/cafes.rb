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
FactoryBot.define do
  factory :cafe do
    name { 'サンプル' }
    nearest_station { '東京駅' }
    transportation { '東京駅日本橋口すぐ' }
    business_hours { '7:00~22:00' }
    regular_holiday { '無' }
    can_takeout { 1 }
    has_parking { 0 }
    has_wifi { 1 }
    has_power_supply { 1 }
    can_smoking { 0 }
    img_path { '/example' }
  end
end
