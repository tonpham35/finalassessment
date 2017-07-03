class UsersController < ApplicationController
	include UsersHelper

	def create
	@user = User.new(full_name: params[:user][:full_name], email: params[:user][:email], password: params[:user][:password])
		if @user.save
			session[:full_name] = @user.full_name
	  		session[:email] = @user.email
	  		session[:user_id] = @user.id

	    	redirect_to users_index_path
		else
			@message = 'Invalid - Log-in already exist and/or invalid password'
		end
	end 

	def signup
	end

	def home
		if signed_in?
			redirect_to users_index_path
		end
	end

	def index
		if signed_in?
			@investments = Investment.where(user: current_user.id).search(params[:symbol],params[:cost_min],params[:cost_max],current_user)
			@symbols = Investment.where(user: current_user.id).distinct.pluck(:symbol)
			respond_to do |format|
		     	format.html
		     	format.js
	    	end
		else
			redirect_to root_path
		end	

	end

	def edit
	    if current_user == User.find(params[:id])
	  	   @user = current_user
	    else
	      redirect_to users_index_path
	    end
  	end

end
