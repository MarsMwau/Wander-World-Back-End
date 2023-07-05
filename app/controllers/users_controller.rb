class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        token = JWT.encode({ user_id: user.id }, ENV['SECRET_KEY'], 'HS256') # use your actual secret key
        render json: { user: user, token: token }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def index
      users = User.all
      render json: users, each_serializer: UserSerializer
    end
  
    def show
      user = User.find(params[:id])
      render json: user, serializer: UserSerializer, include: ['posts.comments', 'posts.likes']
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
  end
  