class ProblemsController < ApplicationController

	#Show the list of all problems
	def index

		if params[:search]
			@problemss = Problem.search(params[:search]).order("created_at DESC")
		else
			@problems = Problem.order("created_at DESC")
		end

		#filter
		@problems = @problems.problem_difficulty(params[:problem_difficulty]) if params[:problem_difficulty].present?

	end

	#Show the specific problem clicked on
	def show
		@problem = Problem.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end



end
