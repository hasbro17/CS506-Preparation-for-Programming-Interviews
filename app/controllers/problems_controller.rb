class ProblemsController < ApplicationController

	#Show the list of all problems
	def index
		#Fetch all problems
		@problems = Problem.order(params[:sort])
		#if params[:search]
	    #  @problems = Problem.search(params[:search]).order("created_at DESC")
	    #else
	    #  @problems = Problem.order("created_at DESC")
	    #end
	end

	#Show the specific problem clicked on
	def show
		@problem = Problem.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end



end
