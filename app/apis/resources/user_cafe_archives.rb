module Resources
  class UserCafeArchives < Grape::API
    resources :user_cafe_archives do
      desc 'return user cafe archives'
      params do
        requires :user_id, type: Integer # TODO: パラメータではなくトークンから引っ張るようにする
      end
      get '/' do
        @user_cafe_archives = UserCafeArchive.includes([:cafe]).order(created_at: :desc).where(user_id: params[:user_id])
        present @user_cafe_archives, with: Entities::UserCafeArchiveEntity
      end
    end
  end
end
