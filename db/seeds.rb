Cafe.create!(
  [
    {
      id: 1,
      name: "スターバックスコーヒー ＪＲ東海東京駅新幹線南ラチ内店",
      nearest_station: "東京駅",
      transportation: "東京駅八重洲地下街8出口（JR横須賀線、JR京浜東北線、JR京葉線、JR山手線、JR上越新幹線、JR総武快速線、JR中央本線、JR長野新幹線、JR東海道新幹線、JR東海道本線）徒歩3分",
      business_hours: "6:30〜09:30",
      regular_holiday: "無",
      can_takeout: 1,
      has_parking: 0,
      has_wifi: 1,
      has_power_supply: 1,
      can_smoking: 0,
      img_path: "assets/icon/coffee-1.svg"
    },
    {
      id: 2,
      name: "スターバックスコーヒー ＪＲ東京駅日本橋口店",
      nearest_station: "東京駅",
      transportation: "東京駅日本橋口すぐ",
      business_hours: "7:00〜22:00",
      regular_holiday: "無",
      can_takeout: 1,
      has_parking: 0,
      has_wifi: 1,
      has_power_supply: 1,
      can_smoking: 0,
      img_path: "assets/icon/coffee-2.svg"
    }
  ]
)

CafeAddress.create!(
  [
    {
      cafe_id: 1,
      post_code: '1000005',
      prefecture: '東京都',
      city: '千代田区丸の内',
      address: '1-9-1',
      building: '東京駅構内南部高架下 JRCP東京支店'
    },
    {
      cafe_id: 2,
      post_code: '1000005',
      prefecture: '東京都',
      city: '千代田区丸の内',
      address: '1-9-1',
      building: '丸の内中央ビル 2F'
    }
  ]
)

CafeMedium.create!(
  [
    {
      cafe_id: 1,
      media_type: :google_map,
      url: 'https://goo.gl/maps/rS7MwD6Sk3x51kqx7'
    },
    {
      cafe_id: 1,
      media_type: :tabelog,
      url: 'https://tabelog.com/tokyo/A1302/A130201/13129153/'
    },
    {
      cafe_id: 2,
      media_type: :google_map,
      url: 'https://goo.gl/maps/cwoFiHgCufUirb1R6'
    }
  ]
)