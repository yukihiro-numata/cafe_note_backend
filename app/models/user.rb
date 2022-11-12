# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  email        :string(255)      not null
#  firebase_uid :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
end
