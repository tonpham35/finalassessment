class UsersController < ApplicationController
	include UsersHelper

	def create
	@user = User.new(full_name: params[:user][:full_name], email: params[:user][:email], password: params[:user][:password])
		if @user.save
			session[:full_name] = @user.full_name
	  		session[:email] = @user.email
	  		session[:user_id] = @user.id

	    	redirect_to root_path
		else
			@message = 'Invalid - Log-in already exist and/or invalid password'
		end
	end 

	def signup
	end

	def home
	end

	def edit
	    if current_user == User.find(params[:id])
	  	   @user = current_user
	    else
	      redirect_to root_path
	    end
  	end

end
