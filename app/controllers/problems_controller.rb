class ProblemsController < ApplicationController

	#Show the list of all problems
	def index
		#Fetch all problems
		@problems = Problem.all
	end

	#Show the specific problem clicked on
	def show
		@problem = Problem.find(params[:id])
	end



end
