FactoryBot.define do
  factory :user do
    firebase_uid { 'uid' }
    email { 'email@example.com' }
  end
end
