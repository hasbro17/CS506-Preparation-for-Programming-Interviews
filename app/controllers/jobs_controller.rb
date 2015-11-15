class JobsController < ApplicationController


	#Show the list of all problems
	def index
    	@search = Job.ransack(params[:q])
  	    @job = @search.result(distinct: true)
	end

	#Show the specific problem clicked on
	def show
		@job = Job.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end
end