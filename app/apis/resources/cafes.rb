module Resources
  class Cafes < Grape::API
    resources :cafes do
      desc 'return cafes'
      get '/' do
        @cafes = Cafe.includes(%i[cafe_address cafe_media]).order(created_at: :desc)
        present @cafes, with:Entities::CafeEntity
      end

      desc 'return a cafe'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @cafe = Cafe.includes(%i[cafe_address cafe_media]).find(params[:id])
        present @cafe, with: Entities::CafeEntity
      end
    end
  end
end
