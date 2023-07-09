class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        token = JWT.encode({ user_id: user.id }, ENV['SECRET_KEY'], 'HS256') 
        render json: { user: user, token: token }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def index
      users = User.includes(posts: [:comments, :likes]).order('posts.created_at DESC')
      render json: users, each_serializer: UserSerializer, include: ['posts.comments', 'posts.likes']
    end
  
    def show
      user = User.includes(posts: [:comments, :likes]).find(params[:id])
      sorted_posts = user.posts.order(created_at: :desc)
      render json: user, serializer: UserSerializer, posts: sorted_posts
    end

    def update
      if @user.update(profile_params)
        render json: { message: 'User profile updated successfully', user: @user }
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    private
  
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
  
    def profile_params
      params.require(:user).permit(:bio, :email, :username)
    end

  end
  