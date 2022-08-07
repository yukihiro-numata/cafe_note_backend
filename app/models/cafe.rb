class Cafe < ApplicationRecord
  has_one :cafe_address, dependent: :destroy
  has_many :cafe_media, dependent: :destroy
end
