module Resources
  class Users < Grape::API
    resources :users do
      desc 'create a user'
      params do
        requires :firebase_uid, type: String
        requires :email, type: String
      end
      post '/' do
        @user = User.create!(firebase_uid: params[:firebase_uid], email: params[:email])
        present @user, with: Entities::UserEntity
      end
    end
  end
end
