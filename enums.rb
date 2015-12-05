require_relative "app/models/solution_checker"
=begin

The enum file for all fixed value types in the data model

The enums are set up in a weird way. Essentially they are just Hashes/dictionaries
with the same key and values. This just makes it more explicit when you use them
and it returns nil for any enum key/value not in the hash

Access an enum from the outside by first including this file by
require_relative "/path/to/file/from/current/position/solution_checker"

then use and enum hash by doing

problem_areas_enum["Linked List"] #=> returns "Linked List"

languages_enum.has_value?("C/C++") #=> returns true

Dont change the value of the enums from the outside or else stuff will break

=end

module Enums

	######Problem Enums########

	#Problem Areas
	@@problem_areas_enum = {
		"Toy" => "Toy",
		"Linked Lists" => "Linked Lists",
		"Trees" => "Trees",
		"Stacks and Queues" => "Stacks and Queues"
	}

	def self.problem_areas_enum
		@@problem_areas_enum
	end

	#Problem Difficulty
	@@problem_difficulty_enum = {
		"Easy" => "Easy",
		"Medium" => "Medium",
		"Hard" => "Hard"
	}

	def self.problem_difficulty_enum
		@@problem_difficulty_enum
	end

	#Ace language mode paths
	@@ace_modes_enum = {
		"C/C++" => "ace/mode/c_cpp",
		"Java" => "ace/mode/java",
		"Python" => "ace/mode/python"
	}

	def self.ace_modes_enum
		@@ace_modes_enum
	end


	######SolutionSubmission Enums########

	#supported languages
	@@languages_enum = {}
	supported_langs = SolutionChecker.supported_langs
	supported_langs.each do |lang|
		@@languages_enum[lang] = lang
	end

	def self.languages_enum
		@@languages_enum
	end

	#solution status
	@@solution_status_enum = {
		"Correct" => "Correct",
		"Incorrect" => "Incorrect",
		"Compilation Error" => "Compilation Error",
		"Runtime Error" => "Runtime Error"
	}

	def self.solution_status_enum
		@@solution_status_enum
	end


	######Job Enums########
	@@job_type_enum = {
		"Full Time" => "Full Time",
		"Internship" => "Internship",
		"Co-op" => "Co-op"
	}

	def self.job_type_enum
		@@job_type_enum
	end

	@@role_type_enum = {
		"Software Engineer" => "Software Engineer",
		"Full-Stack Developer" => "Full-Stack Developer",
		"Backend Developer" => "Backend Developer",
		"Frontend Developer" => "Frontend Developer",
		"Data Scientist" => "Data Scientist",
		"Mobile Developer" => "Mobile Developer"
	}

	def self.role_type_enum
		@@role_type_enum
	end

end