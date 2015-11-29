class UsersController < ApplicationController
	before_filter :save_login_state, :only => [:new, :create]
	before_filter :set_notice, :only => [:create]

	def set_notice
		@success_notice = "You signed up successfully"
		@failure_notice = "Form is invalid"
	end

	def new
	@user = User.new
	end

	def create
		@user = User.new(person_params)
		if @user.save
			flash[:notice] = "#{@success_notice}"
				#creates a session with username
			session[:user_id] = @user.id
			redirect_to(:controller => 'sessions', :action => 'profile')
		else
			flash[:notice] = "#{@failure_notice}"
			render "new"
		end
	end

	def person_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
	end

	def setting
	end


end
