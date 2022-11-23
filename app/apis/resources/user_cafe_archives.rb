module Resources
  class UserCafeArchives < Grape::API
    resources :user_cafe_archives do
      desc 'return user cafe archives'
      get '/' do
        user = authenticate!
        @user_cafe_archives = UserCafeArchive.includes([:cafe]).order(created_at: :desc).where(user_id: user.id)
        present @user_cafe_archives, with: Entities::UserCafeArchiveEntity
      end

      desc 'return an user cafe archive'
      params do
        requires :user_cafe_archive_id, type: Integer
      end
      get '/:user_cafe_archive_id' do
        user = authenticate!
        @user_cafe_archive = UserCafeArchive.includes(%i[cafe user_cafe_archive_images]).find_by!(
          id: params[:user_cafe_archive_id], user_id: user.id
        )
        present @user_cafe_archive, with: Entities::UserCafeArchiveEntity
      end
    end
  end
end
