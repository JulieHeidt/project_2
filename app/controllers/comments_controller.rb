class CommentsController < ApplicationController
	include SessionsHelper
	def index
		@comments = Comment.all 
		# @comment_count = @comment.count
	end

	def show
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@user = current_user
	end


	def new
    	@post = Post.find(params[:post_id])
    	@user = current_user
		@comment = Comment.new
		#@comment.user = current_user
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new( comment_params )
		#@post.comments.create(comment_params)
		#@comment.user = current_user
		@user = current_user
		@post.comments << @comment
		@user.comments << @comment
		if @comment.save
			redirect_to user_post_path(@user, @post)
		else
			render :new
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update	
		@comment = Comment.find(params[:id])
		if @comment.update
			redirect_to @comment, data: { alert: 'comment was successfully updated.' }
		else 
			render :edit
		end
	end

	def count
	end

	def destroy
		@comment = @Comment.find(params[:id])
    	@comment.destroy
			redirect_to user_posts_path, alert: "comment was successfully deleted."
	end

	private
	def comment_params
      params.require(:comment).permit(:body)
    end
end



