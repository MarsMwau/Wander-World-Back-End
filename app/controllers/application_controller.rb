class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authenticate_user, except: [:create]

  def current_user
    return unless cookies.signed[:jwt]

    token = cookies.signed[:jwt]
    payload = JwtToken.decode(token)
    @current_user ||= User.find_by(id: payload['user_id'])
  end

  def authenticate_user
    render json: { errors: ['Unauthorized'] }, status: :unauthorized unless current_user
  end
end
