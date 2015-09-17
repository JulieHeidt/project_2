class PostsController < ApplicationController
	include SessionsHelper
	def index
		@posts = Post.all
		@user = current_user
	end

	def new
		@post = Post.new
		@user = current_user
	end

	def create
		@user = User.find(current_user)
		@post = @user.posts.new(post_params)
   		if @post.save
    		redirect_to user_posts_path
    	else
    		render :new
    	end
	end

	def show
		@user = current_user
		@post = @user.posts.find(params[:id])
	end

	def edit
		@user = current_user
		@post = @user.posts.find(params[:id])
		
		end

	def update
		@post = Post.find(params[:id])
		@user = current_user
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
			redirect_to root_path, notice: 'Post was successfully deleted.'
		console.log("gotcha")
		end

	private
	 def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
