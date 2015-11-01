class SessionsController < ApplicationController
	before_filter :authenticate_user, :only => [:profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
  end

	def login_attempt
		logger.info( "attempt to login")
		authorized_user = User.authenticate(login_params)
		if authorized_user
			puts "successful login"
			session[:user_id] = authorized_user.username;
			flash[:notice] = "You logged in as #{authorized_user.username}"
			redirect_to(:action => 'profile')
		else
			flash[:notice] = "Invalid Username or Password"
			puts "Failed login"
			render "login"
		end
	end

	def login_params
		params.permit(:username_or_email, :login_password)
	end
	
	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

	def profile
		render "sessions/profile"
	end

	def setting
	end

end
