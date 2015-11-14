class SessionsController < ApplicationController

#these call functions in the application controller to save and maintain user data
	before_filter :authenticate_user, :only => [:profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]

#called on navigation to login page. Redirects to profile if user logged in
  def login
		if @current_user
			render "sessions/profile"
		end
  end

#an attempt to login. Called on login submit
	def login_attempt
		#call authenticate method in model to check for correct parameters
		authorized_user = User.authenticate(login_params)
		if authorized_user
			#creates a session with username
			session[:user_id] = authorized_user.username;
			#notifications
			flash[:notice] = "You logged in as #{authorized_user.username}"
			redirect_to(:action => 'profile')
		else #failed login attempt
			flash[:notice] = "Invalid Username or Password"
			puts "Failed login"
			render "login"
		end
	end

#setup parameters for login attempt
	def login_params
		params.permit(:username_or_email, :login_password)
	end
	
#logout method. Destroys user session
	def destroy
		session[:user_id] = nil
		flash[:notice] = "You've successfully logged out"
		render "login"
	end

#profile page renderer. Checks for logged-in user and then renders profile page or login page
	def profile
	end

#Modifies profile information and settings. Called from Modify Profile view. Params are optional 
	def setting
		user = @current_user #logged in user

		if setting_params[:email].present?#email update
			user.update_attribute(:email, setting_params[:email])
		end
		
		if setting_params[:first_name].present?#first name update
			user.update_attribute(:first_name, setting_params[:first_name])
		end

		if setting_params[:last_name].present?#last name update
			user.update_attribute(:last_name, setting_params[:last_name])
		end
		
		if setting_params[:company].present?#company update
			user.update_attribute(:company, setting_params[:company])
		end
	end

	def setting_params
		params.permit(:email, :first_name, :last_name, :company)
	end
end
