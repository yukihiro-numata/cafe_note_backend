module APIHelper
  include Rails.application.routes.url_helpers

  TOKEN_PREFIX = /^Bearer\s/
  TOKEN_REGEX = /^Bearer\s(.+)/

  def bearer_token
    authorization_header = headers['Authorization']
    return nil unless authorization_header && authorization_header.match(TOKEN_REGEX)
    authorization_header.gsub(TOKEN_PREFIX, '')
  end

  def current_user
    return nil if bearer_token.nil?
    # TODO: JWTの検証を行うようにする
    decoded_token = JWT.decode(bearer_token, nil, false)
    User.find_by!(firebase_uid: decoded_token[0]['user_id'])
  end

  def authenticate!
    user = current_user
    user.present? ? user : error!('Unauthorized. Invalid or expired token.', 401)
  end
end
