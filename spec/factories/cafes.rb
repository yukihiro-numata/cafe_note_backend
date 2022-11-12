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
