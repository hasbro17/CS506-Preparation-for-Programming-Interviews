class ProblemsController < ApplicationController

	#Show the list of all problems
	def index

		@problems = search_query(params[:search])

		if params[:difficulty_level].present?
			@problems = filter(@problems, params[:difficulty_level])
		end

		if params[:SortName].present?
			@problems = sort_by_title(@problems)
		end
=begin
		if params[:search]
			@problems = Problem.search(params[:search]).order("created_at DESC")
		else
			@problems = Problem.order("created_at DESC")
		end
=end

		#filter
		#@problems = @problems.difficulty_level(params[:difficulty_level]) if params[:difficulty_level].present?

		#@problems = @problems.sort_by &:problem_title if params[:SortName].present?

	end

	#Show the specific problem clicked on
	def show
		@problem = Problem.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end


	#Returns records filtered by search query, returns all if qurey nil
	def search_query(query)
		if params[:search]
			@problems = Problem.search(query).order("created_at DESC")
		else
			@problems = Problem.order("created_at DESC")
		end
	end


	#Filters the given problems by level. If level nil, then no filter
	def filter(problems, level)
		@problems = @problems.difficulty_level(level)
	end

	#sorts the given problems by title and returns them
	def sort_by_title(problems)
		@problems = @problems.sort_by &:problem_title #if params[:SortName].present?
	end




end
