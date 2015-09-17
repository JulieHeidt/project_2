class CommentsController < ApplicationController
	include SessionsHelper
	def index
		@comments = Comment.all 
		# @comment_count = @comment.count
	end

	def show
		@comment = Comment.find(params[:id])
	end


	def new
    	@post = Post.find(params[:post_id])
		@comment = @post.comments.new
		@comment.user = current_user
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params.require(comment_params))
		if @comment.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update	
		@comment = Comment.find(params[:id])
		if @comment.update(post_params)
			redirect_to @comment, alert: 'comment was successfully updated.'
		else 
			render :edit
		end
	end

	def destroy
		@comment = @Comment.find(params[:id])
    	@comment.destroy
			redirect_to user_post_path, alert: "comment was successfully deleted."
	end

	private
	def comment_params
      params.require(:comment).permit(:name, :body, :email)
    end
end



