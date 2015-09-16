class SessionsController < ApplicationController
	include SessionsHelper
	def new
	end
	
	def create
		puts params
		user = User.find_by(email: params[:user][:email])
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id.to_s
	     	redirect_to user_path(user)
     	else
     		render :new
     	end
	end
	
	def destroy
		session.delete(:user_id)
	    redirect_to login_path
	end
end