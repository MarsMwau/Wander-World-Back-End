class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :like, :unlike]
  def index
    posts = Post.includes(:user).order(created_at: :desc)
    render json: posts, each_serializer: PostSerializer
  end
  

  def show
    render json: @post, serializer: PostSerializer
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @post.user == current_user
      if @post.update(post_params)
        render json: @post
      else
        render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['You are not authorized to update this post'] }, status: :unauthorized
    end
  end

  def destroy
    if @post.user == current_user
      @post.destroy
      head :no_content
    else
      render json: { errors: ['You are not authorized to delete this post'] }, status: :unauthorized
    end
  end

  def get_comments
    @post = Post.find(params[:id])
    comments = @post.comments
    render json: comments, each_serializer: CommentSerializer
  end

  def get_comment
    comment = @post.comments.find(params[:comment_id])
    render json: comment, serializer: CommentSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Comment not found' }, status: :not_found
  end

  def create_comment
    post = Post.find(params[:id])
    comment = post.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete_comment
    comment = Comment.find(params[:comment_id])
    if comment.user == current_user || comment.post.user == current_user
      comment.destroy
      head :no_content
    else
      render json: { errors: ['You are not authorized to delete this comment'] }, status: :unauthorized
    end
  end

  def show_likes
    @post = Post.find(params[:id])
    likes = @post.likes
    render json: likes, each_serializer: LikeSerializer
  end

  def like
    if @post.likes.exists?(user: current_user)
      render json: { errors: ['You have already liked this post'], liked_by_current_user: true }, status: :unprocessable_entity
    else
      like = @post.likes.build(user: current_user)
      if like.save
        render json: { message: 'Post liked successfully', post: @post, liked_by_current_user: true }
      else
        render json: { errors: like.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  
  def unlike
    like = @post.likes.find_by(user: current_user)
    if like
      like.destroy
      render json: { message: 'Post unliked successfully', post: @post, liked_by_current_user: false }
    else
      render json: { errors: ['You have not liked this post'], liked_by_current_user: false }, status: :unprocessable_entity
    end
  end
  

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end