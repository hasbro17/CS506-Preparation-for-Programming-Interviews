class Job < ActiveRecord::Base
	has_one :job_page
	validates :job_title, presence: true, uniqueness: true
  validates :job_description, presence: true
  validates :job_type, presence: true
 
  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("job_title like ?", "%#{query}%") 
    where("job_description like ?", "%#{query}%") 
    where("job_type like ?", "%#{query}%") 
  end
end
