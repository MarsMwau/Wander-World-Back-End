class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments, each_serializer: CommentSerializer
    end
    
    def show
        comment = Comment.find(params[:id])
        render json: comment, serializer: CommentSerializer
    end

end
