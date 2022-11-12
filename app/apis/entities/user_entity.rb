module Entities
  class UserEntity < Grape::Entity
    expose :id
    expose :firebase_uid
    expose :email
  end
end
