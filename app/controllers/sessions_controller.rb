class SessionsController < ApplicationController
  include UsersHelper

	def create
		@user = User.find_by(email: params[:user][:email])
		session.clear
		if @user && @user.authenticate(params[:user][:password])
	  		session[:email] = @user.email
	  		session[:full_name] = @user.full_name
	  		session[:user_id] = @user.id
	    	redirect_to users_index_path
		else
			@message = 'Invalid Log-in. Check email and password'
      redirect_to root_path
		end
	end

	def destroy
		session[:user_id] = nil	
		redirect_to root_path
	end

	def create_from_omniauth
      auth_hash = request.env["omniauth.auth"]
      authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

      # if: previously already logged in with OAuth
      if authentication.user
        user = authentication.user
        authentication.update_token(auth_hash)
      # else: user logs in with OAuth for the first time
      session[:email] = user.email
      session[:full_name] = user.full_name
      session[:user_id] = user.id
      redirect_to users_index_path
      else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        # you are expected to have a path that leads to a page for editing user details
      session[:email] = user.email
      session[:full_name] = user.full_name
      session[:user_id] = user.id
      redirect_to users_index_path
      end

    end
end
