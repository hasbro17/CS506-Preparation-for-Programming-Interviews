class Job < ActiveRecord::Base
	has_one :job_page


	scope :job_type, -> (job_type) { where job_type: job_type }
	#scope :role_type, -> (role_type) { where role_type: role_type }
	scope :role_type, -> (role) { where role_type: role }
	scope :location, -> (location) { where location: location }

	 # It returns the jobs whose titles, roles, types, locations, company names contain one or more words that form the query
	 def self.search(query)
    	# where(:title, query) -> This would return an exact match of the query
    	where("job_title like ? OR location like ? OR job_type like ? OR role_type like ? OR company_name like ?", "%#{query}%", "%#{query}%", "%#{query}%",  "%#{query}%", "%#{query}%") 
    end

end
