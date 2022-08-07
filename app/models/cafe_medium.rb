class CafeMedium < ApplicationRecord
  enum media_type: { google_map: 0, tabelog: 1 }

  belongs_to :cafe
end
