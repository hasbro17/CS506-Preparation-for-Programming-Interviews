class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def authenticate_user
		puts "authenticate_user"
		if session[:user_id]
			#set current user object to @current_user object variable
			@current_user = User.find_by(username: session[:user_id])
			return true
		else
			redirect_to(:controller => 'sessions', :action => 'login')
			return false
		end
	end

	#def current_user
	#	@_current_user ||= session[:current_user_id] &&  User.find_by(id: session[:current_user_id])
	#end

	def save_login_state
		if session[:id]
			redirect_to(:controller => 'sessions', :action => 'profile')
			return false
		else
			return true
		end
	end
end
