class Root < Grape::API
  format :json
  content_type :json, 'application/json; charset=utf-8'
  helpers APIHelper

  rescue_from ActiveRecord::RecordNotFound do |e|
    rack_response({ message: e.message, status: 404 }.to_json, 404)
  end
  rescue_from Grape::Exceptions::ValidationErrors do |e|
    rack_response({ message: "invalid arguments, #{e.message}", status: 400 }.to_json, 400)
  end

  mount Resources::Users
  mount Resources::Cafes
  mount Resources::UserCafeArchives
end
