class SessionsController < ApplicationController
	include SessionsHelper
	def new
		current_user
	end
	
	def create
		puts params
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
	     	redirect_to user_path(@user)
     	else
     		render :new
     		puts "Not authenticating"
     	end
	end
	
	def destroy
		session.delete(:user_id)
	    redirect_to login_path
	end

	private

  	def session_params
    	params.require(:user).permit(:email, :password)
  	end
end