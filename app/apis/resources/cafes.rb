module Resources
  class Cafes < Grape::API
    resources :cafes do
      desc 'return a cafe'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @cafe = Cafe.find(params[:id])
        present @cafe, with: Entities::CafeEntity
      end
    end
  end
end
