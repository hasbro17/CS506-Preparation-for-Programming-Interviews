class JobsController < ApplicationController

	#Show the list of all problems
	def index
		#Fetch all problems
		@jobs = Job.order(params[:sort])
		#if params[:search]
	    #  @jobs = Job.search(params[:search]).order("created_at ASC")
	    #else
	    #  @jobs = Job.order("created_at ASC")
	    #end
	end

	#Show the specific problem clicked on
	def show
		@job = Job.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end
end