require_relative "solution_checker"
require_relative "../../enums"

class SolutionSubmission < ActiveRecord::Base
#include Enums # can't include this for some reason
	belongs_to :user


	def send_to_checker()

		#Lookup and find actual problem
		problem = Problem.find(self.problem_id)

		#if the problem is supported for the language
		if(problem.supported_langs!=nil)
			#check what language index are we are looking at for this submission
			lang_index = problem.supported_langs.find_index(self.language)
		
			#Get stdout for solution code, redundant but okay for now
			actual_solution = problem.test_prefix[lang_index] + problem.solution_code[lang_index] + problem.test_suffix[lang_index]
			r1 = SolutionChecker.post_check(actual_solution, self.language, problem.given_stdin[lang_index])
			
			#Update expected stdout
			expected_stdout = problem.expected_stdout
			expected_stdout[lang_index] = r1["output"]
			Problem.update(problem.id, expected_stdout: expected_stdout)

			#Get stdout for user submitted code
			user_code = problem.test_prefix[lang_index] + self.submitted_code + problem.test_suffix[lang_index]
			r2 = SolutionChecker.post_check(user_code, self.language, self.stdin)
			stdout = r2["output"]
			self.generated_stdout = stdout
			self.generated_errors = r2["errors"]

			#Now check if user solution is valid, add checks for compilation error later
			if stdout == expected_stdout[lang_index]
				#self.solution_status = Enums::solution_status_enum["Correct"]
				self.solution_status = "Correct"
			else
				#self.solution_status = Enums::solution_status_enum["Incorrect"]
				self.solution_status = "Incorrect"
			end

			return true
		else #language not supported: just execute code and don't save submission
			results = SolutionChecker.post_check(self.submitted_code, self.language, self.stdin)
			self.generated_stdout = results["output"]
			self.generated_errors = results["errors"]
			self.solution_status = "Incorrect"
			return false
		end

		puts "\nRESULTS\n"
		puts "\n\nSTDOUT: " + self.generated_stdout
		puts "\n\nSTDERR: " + self.generated_errors



	end
end
