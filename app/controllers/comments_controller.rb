class CommentsController < ApplicationController
	before_action :authenticate?
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = comment.(params[:user_id])
		@comment = @user.comments.new(comment_params)
   		if @comment.save
    		redirect_to user_post_comment_path
    	else
    		render :new
    	end
	end

	private
	def comment_params
      params.require(:comment).permit(:name, :body, :email)
    end
end
