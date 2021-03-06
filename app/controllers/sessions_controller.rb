class SessionsController < ApplicationController

#these call functions in the application controller to save and maintain user data
	before_filter :authenticate_user, :only => [:profile, :setting, :stats]
	before_filter :save_login_state, :only => [:login, :login_attempt]
	before_filter :stats, :only =>[:profile]
	before_filter :set_notice, :only => [:login_attempt, :destroy, :setting]

#sets value of notice variables
	def set_notice
		@success_notice = "You logged in as "
		@failure_notice = "Invalid Username or Password"
		@logout_notice = "You've successfully logged out"
		@modify_notice = "Profile Modified"
	end

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
			#creates a session with userid
			session[:user_id] = authorized_user.id;
			#notifications
			flash[:notice] = "#{@success_notice} " + " #{authorized_user.username}"
			redirect_to(:action => 'profile')
		else #failed login attempt
			puts @failure_notice
			flash[:notice] = "#{@failure_notice}"
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
		flash[:notice] = "#{@logout_notice}"
		render "login"
	end

#profile page renderer. Checks for logged-in user and then renders profile page or login page
	def profile
	end


#creates statistics to be displayed on the profile page
	def stats
		#NOTE: All of this code should be using the enums from the Enums file
		# and should be moved to the model.
		@nil = "Not Defined"
		submissions = SolutionSubmission.where("user_id = ?", @current_user.id)
		@total = submissions.count
		@correct = 0
		@lang_count = {"C/C++" => 0, "Java" => 0, "Python" => 0,}
		#Measure counts
		submissions.each do |submission|
			if submission.solution_status == "Correct"
				@correct += 1
			end
			if submission.language == "C/C++"
				@lang_count["C/C++"] += 1
			elsif submission.language == "Java"
				@lang_count["Java"] += 1
			elsif submission.language == "Python"
				@lang_count["Python"] += 1
			end
		end
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
		if setting_params[:avatar].present?
			user.update_attribute(:avatar, setting_params[:avatar])
		end
		flash[:notice] = "#{@modify_notice}"
	end

	def setting_params
		params.permit(:email, :first_name, :last_name, :company, :avatar)
	end
end
