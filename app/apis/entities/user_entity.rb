module Entities
  class UserEntity < BaseEntity
    expose :id
    expose :firebase_uid
    expose :email
  end
end
