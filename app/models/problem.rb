class Problem < ActiveRecord::Base
  #attr_accessible :problem_title, :problem_description
 
  validates :problem_title, presence: true, uniqueness: true
  validates :problem_description, presence: true
 
  # It returns the articles whose titles contain one or more words that form the query	
	def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("problem_title like ?", "%#{query}%") 
  end
end
