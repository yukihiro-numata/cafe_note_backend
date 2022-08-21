# == Schema Information
#
# Table name: cafe_addresses
#
#  id         :bigint           not null, primary key
#  address    :string(255)      not null
#  building   :string(255)
#  city       :string(255)      not null
#  post_code  :string(7)        not null
#  prefecture :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cafe_id    :bigint           not null
#
# Indexes
#
#  index_cafe_addresses_on_cafe_id  (cafe_id)
#
# Foreign Keys
#
#  fk_rails_...  (cafe_id => cafes.id)
#
class CafeAddress < ApplicationRecord
  belongs_to :cafe
end
