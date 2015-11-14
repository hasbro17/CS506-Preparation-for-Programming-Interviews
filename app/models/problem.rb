class Problem < ActiveRecord::Base
	scope :problem_difficulty, -> (problem_difficulty) { where problem_difficulty: problem_difficulty }

	 # It returns the articles whose titles contain one or more words that form the query
  	def self.search(query)
    	# where(:title, query) -> This would return an exact match of the query
    	where("problem_title like ?", "%#{query}%") 
  	end

end
