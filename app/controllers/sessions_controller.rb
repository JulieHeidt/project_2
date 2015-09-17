class SessionsController < ApplicationController
	include SessionsHelper
	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id.to_s
	     	redirect_to root_path
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