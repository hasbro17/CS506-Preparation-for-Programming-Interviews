require_relative "solution_checker"

class SolutionSubmission < ActiveRecord::Base
	belongs_to :user

	def send_to_checker()
		results = SolutionChecker.post_check(self.solution_string, self.language, "stdin")
		self.solution_status = results["output"]
	end
end
