module Resources
  class Cafes < Grape::API
    resources :cafes do
      desc 'return cafes'
      get '/' do
        @cafes = Cafe.includes(%i[cafe_address cafe_media]).order(created_at: :desc)
        present @cafes, with: Entities::CafeEntity
      end

      desc 'return a cafe'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @cafe = Cafe.includes(%i[cafe_address cafe_media]).find(params[:id])
        present @cafe, with: Entities::CafeEntity
      end

      desc 'archive visiting a cafe'
      params do
        requires :id, type: Integer
        requires :rating, type: Integer, values: 1..5
        requires :visited_date, type: Date
        optional :memo, type: String
        optional :image_paths, type: Array[String]
      end
      post '/:id/archive' do
        user = authenticate!
        cafe = Cafe.find(params[:id])
        ActiveRecord::Base.transaction do
          @archive = UserCafeArchive.create!(
            user_id: user.id,
            cafe_id: cafe.id,
            rating: params[:rating],
            memo: params[:memo],
            visited_date: params[:visited_date],
          )
          image_inputs = params[:image_paths].map do |p|
            UserCafeArchiveImage.new(user_cafe_archive_id: @archive.id, image_path: p)
          end
          UserCafeArchiveImage.import!(image_inputs)
        end
        present @archive, with: Entities::UserCafeArchiveEntity
      end
    end
  end
end
