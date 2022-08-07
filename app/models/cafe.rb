class Cafe < ApplicationRecord
  has_one :cafe_address, dependent: :destroy
end
