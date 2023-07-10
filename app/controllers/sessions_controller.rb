class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      expiration_time = 1.day.from_now.to_i
      token = JWT.encode({ user_id: user.id, exp: expiration_time },'123', 'HS256')
      render json: { token: token, user: user }
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy
    cookies.delete(:jwt)
    head :no_content
    render json: { message: "Logged out successfully" }
  end

end
