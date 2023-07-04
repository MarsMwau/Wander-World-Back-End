class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
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
        params.permit(:email, :username, :password, :password_confirmation)
    end

end
