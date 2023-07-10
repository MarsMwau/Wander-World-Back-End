class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments, each_serializer: CommentSerializer
    end
    
    def show
        comment = Comment.find(params[:id])
        render json: comment, serializer: CommentSerializer
    end

    def destroy
        comment = Comment.find(params[:comment_id])
        if comment.user == current_user || comment.post.user == current_user
          comment.destroy
          head :no_content
        else
          render json: { errors: ['You are not authorized to delete this comment'] }, status: :unauthorized
        end
      end

end
