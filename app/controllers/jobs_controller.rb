class JobsController < ApplicationController

	#Show the list of all problems
	def index
		#Fetch all problems
		@jobs = Job.all
	end

	#Show the specific problem clicked on
	def show
		@job = Job.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end

end
