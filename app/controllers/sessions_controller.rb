class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, ENV['SECRET_KEY'], 'HS256')
      render json: { token: token, user: user }
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end
end
