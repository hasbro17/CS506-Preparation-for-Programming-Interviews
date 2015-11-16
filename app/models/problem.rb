class Problem < ActiveRecord::Base
	scope :difficulty_level, -> (difficulty_level) { where difficulty_level: difficulty_level }
	validates :problem_title, presence: true, :length => {:in => 3..20}

	 # It returns the articles whose titles contain one or more words that form the query
  	def self.search(query)
    	# where(:title, query) -> This would return an exact match of the query
    	where("problem_title like ?", "%#{query}%") 
  	end

end
