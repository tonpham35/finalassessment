class SessionsController < ApplicationController
	def create
		@user = User.find_by(email: params[:user][:email])
		session.clear
		if @user && @user.authenticate(params[:user][:password])
	  		session[:email] = @user.email
	  		session[:full_name] = @user.full_name
	  		session[:user_id] = @user.id
	    	redirect_to root_path
		else
			@message = 'Invalid Log-in. Check email and password'
		end
	end

	def destroy
		session[:user_id] = nil	
		redirect_to root_path
	end
end
