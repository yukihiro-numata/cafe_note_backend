FactoryBot.define do
  factory :cafe_address do
    post_code { '1234567' }
    prefecture { '東京都' }
    city { '中央区' }
    address { '1-1-1' }
    building { '' }
  end
end
