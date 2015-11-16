class SolutionSubmissionsController < ApplicationController
	before_filter :authenticate_user, :only => [:create, :show, :index]


	#Show list of solution submissions
	def index
		#Ensure that problem_id is passed in as a param, error otherwise
		problem_id = problem_id_param
		#Fetch problem
		@problem = Problem.find(problem_id)
		#Fetch all submissions with current user_id and given problem_id
		@solution_submissions = SolutionSubmission.where("user_id = ? AND problem_id = ?", @current_user.id, problem_id)
	end


	def show
		@solution_submission = SolutionSubmission.find(params[:id])
		@problem = Problem.find(@solution_submission.problem_id)
	end


	def create
		@solution_submission = SolutionSubmission.new(solution_submission_params)
		#Can get rid of date_submitted, already have created timestamp
		@solution_submission.date_submitted = Date.today
		@solution_submission.user_id = @current_user.id

		@solution_submission.send_to_checker()

		#If problem is supported for this language
		@solution_submission.save
		redirect_to @solution_submission

		#@solution_submission.solution_status = 'Unchecked' #Need to change this to an enum
		
	end


	private
	def solution_submission_params
		params.require(:solution_submission).permit(:submitted_code, :problem_id, :user_id, :stdin, :language)
	end

	def problem_id_param
		params.require(:problem_id)
	end
end
