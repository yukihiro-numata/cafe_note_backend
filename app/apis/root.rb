class Root < Grape::API
  format :json

  mount Resources::Users
  mount Resources::Cafes
end
