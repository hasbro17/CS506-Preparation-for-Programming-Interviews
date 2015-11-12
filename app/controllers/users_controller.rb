class UsersController < ApplicationController
	before_filter :save_login_state, :only => [:new, :create]

	def new
	@user = User.new
	end

	def create
		@user = User.new(person_params)
		if @user.save
				flash[:notice] = "You signed up successfully"
		else
			flash[:notice] = "Form is invalid"
		end
	render "new"
	end

	def person_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
