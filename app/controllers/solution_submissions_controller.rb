class SolutionSubmissionsController < ApplicationController


	def show
		@solution_submission = SolutionSubmission.find(params[:id])
	end


	def create
		@solution_submission = SolutionSubmission.new(solution_submission_params)
		#Can get rid of date_submitted, already have created timestamp
		@solution_submission.solution_status = 'Unchecked' #Need to change this to an enum
		@solution_submission.save
		redirect_to @solution_submission
	end


	private
	def solution_submission_params
		params.require(:solution_submission).permit(:solution_string, :problem_id, :language)
	end
end
