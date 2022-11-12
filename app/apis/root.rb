class Root < Grape::API
  format :json

  mount Resources::Cafes
end
