module UsersHelper
  # This will return the current user, if they exist
  # Replace with code that works with your application
  	def current_user
    	if session[:user_id]
    		current_user ||= User.find_by_id(session[:user_id])
    	end
  	end

  # Returns true if current_user exists, false otherwise
  	def signed_in?
    	!current_user.nil?
  	end
end
