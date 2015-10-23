class User < ActiveRecord::Base
	has_many :solution_submission
end
