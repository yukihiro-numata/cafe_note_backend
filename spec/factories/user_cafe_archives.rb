FactoryBot.define do
  factory :user_cafe_archive do
    rating { 1 }
    memo { 'sample' }
    visited_at { Time.zone.local(2022, 11, 15) }
  end
end
