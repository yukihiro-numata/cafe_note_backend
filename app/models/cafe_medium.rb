class CafeMedium < ApplicationRecord
  enum type: { google_map: 0, tabelog: 1 }

  belongs_to :cafe
end
