module Entities
  class UserEntity < BaseEntity
    expose :id, expose_nil: false
    expose :firebase_uid, expose_nil: false
    expose :email, expose_nil: false
  end
end
