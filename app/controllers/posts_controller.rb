class PostsController < ApplicationController
	include SessionsHelper
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.new(post_params)
   		if @post.save
    		redirect_to posts_path
    	else
    		render :new
    	end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			# why attributes
			redirect_to @post, notice: 'Post was successfully updated.'
		else 
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
    	@post.destroy
			redirect_to posts_path, notice: 'Post was successfully deleted.'
		end

	private
	 def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
