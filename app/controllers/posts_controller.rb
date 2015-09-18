class PostsController < ApplicationController
	include SessionsHelper
	def index
		@posts = current_user.posts
		if current_user.admin
			@posts = Post.all
		else
			@posts = current_user.posts
		end
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
		@user = User.find( current_user[:id])
		@post = Post.find(params[:id])
	end

	def edit
		@user = current_user
		@post = Post.find(params[:id])
		# cannot delete edited message
		
	end

	def update
		@post = Post.find(params[:id])
		@user = current_user
		if @post.update_attributes(post_params)
			# why attributes
			redirect_to user_posts_path, notice: 'Post was successfully updated.'
		else 
			render :edit
		end
	end

	def destroy
	   post = Post.find(params[:id])
	   Comment.where({post_id: post.id }).destroy_all
	   Post.destroy( post.id )
	   redirect_to user_posts_path
	end

	private
	def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end