# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cafe.create!(
  [
    {
      id: 1,
      name: "コメダ珈琲成増駅前店",
      nearest_station: "東武東上線成増駅",
      transportation: "東武東上線【成増駅】徒歩１分\n東京メトロ有楽町線・副都心線【地下鉄成増駅】徒歩２分\n\n\n地下鉄成増駅から94m",
      business_hours: "7:00〜20:00",
      regular_holiday: "無",
      can_takeout: 1,
      has_parking: 0,
      has_wifi: 1,
      has_power_supply: 1,
      can_smoking: 0,
      memo: "コンセントはあるが狭い席か、コンセントはないが広い席がある。",
      img_path: "assets/icon/coffee-1.svg",
      tabelog_url: "https://tabelog.com/tokyo/A1322/A132204/13185412/"
    },
    {
      id: 2,
      name: "スターバックスコーヒー エキア成増店",
      nearest_station: "東武東上線成増駅",
      transportation: "東武東上線【成増駅】直結\n東京メトロ有楽町線・副都心線【地下鉄成増駅】徒歩３分\n\n\n成増駅から5m",
      business_hours: "7:00〜22:30",
      regular_holiday: "無",
      can_takeout: 1,
      has_parking: 0,
      has_wifi: 1,
      has_power_supply: 0,
      can_smoking: 0,
      memo: "TSUTAYAの本屋が目の前にある",
      img_path: "assets/icon/coffee-2.svg",
      tabelog_url: "https://tabelog.com/tokyo/A1322/A132204/13193724/"
    }
  ]
)

CafeAddress.create!(
  [
    {
      cafe_id: 1,
      post_code: '1750094',
      prefecture: '東京都',
      city: '板橋区成増',
      address: '2-15-18',
      building: '成増プライム2階'
    },
    {
      cafe_id: 2,
      post_code: '1750094',
      prefecture: '東京都',
      city: '板橋区成増',
      address: '2-13-1',
      building: 'EQUiA成増2階'
    }
  ]
)