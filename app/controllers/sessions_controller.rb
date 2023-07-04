class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          token = JwtToken.encode(user_id: user.id)
          cookies.signed[:jwt] = { value: token, httponly: true }
          render json: { user: user, token: token }
        else
          render json: { errors: ['Invalid email or password'] }, status: :unauthorized
        end
    end
    
    def destroy
        cookies.delete(:jwt)
        head :no_content
    end
end
