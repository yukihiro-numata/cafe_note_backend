# == Schema Information
#
# Table name: cafe_media
#
#  id         :bigint           not null, primary key
#  media_type :integer          not null
#  url        :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cafe_id    :bigint           not null
#
# Indexes
#
#  index_cafe_media_on_cafe_id  (cafe_id)
#
# Foreign Keys
#
#  fk_rails_...  (cafe_id => cafes.id)
#
class CafeMedium < ApplicationRecord
  enum media_type: { google_map: 0, tabelog: 1 }

  belongs_to :cafe
end
