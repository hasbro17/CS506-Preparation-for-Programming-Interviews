#require_relative "../../enums"
class JobsController < ApplicationController
include Enums
	#Show the list of all jobs
	def index
		#Fetch all jobs
		#@jobs = Job.all

		@jobs = search_query(params[:search])

		if params[:job_type].present?
			@jobs = filter_type(@jobs, params[:job_type])
		end

		if params[:role_type].present?
			@jobs = filter_role(@jobs, params[:role_type])
		end

		if params[:job].present?
			if params[:job][:location].present?
				@jobs = filter_location(@jobs, params[:job][:location])
			end
			
			if params[:job][:role_type].present? && params[:job][:role_type].size > 1

				@jobs = filter_role(@jobs, params[:job][:role_type])
			end
		end


		if params[:SortType].present?
			if params[:SortType] == "NumViews"
				@jobs = sort_by_views(@jobs)
			elsif params[:SortType] == "Date"
				@jobs = sort_by_date_posted(@jobs)
			end		
		end

		#Prepare options for location select
		#@locations = Job.select(:location).distinct



	end

	#Show the specific job clicked on
	def show
		@job = Job.find(params[:id])
		#increment number of views for job
		@job.num_views += 1
		@job.save 
		#@user = User.find(FindUserFromSessionOrCookie)
	end


	#Returns records filtered by search query, returns all if qurey nil
	def search_query(query)
		if params[:search]
			@jobs = Job.search(query).order("created_at DESC")
		else
			@jobs = Job.order("created_at DESC")
		end
	end


	#Filters the given jobs by role. If role nil, then no filter
	def filter_type(jobs, type)
		@jobs = @jobs.job_type(type)
	end

	#Filters the given jobs by type(Full time, Internship). If role nil, then no filter
	def filter_role(jobs, role)
		@jobs = @jobs.role_type(role)
	end

	#Filters the given jobs by role. If role nil, then no filter
	def filter_location(jobs, location)
		@jobs = @jobs.location(location)
	end

	#sorts the given jobs by title and returns them
	def sort_by_views(jobs)
		@jobs = @jobs.sort_by(&:num_views).reverse #if params[:SortName].present?
	end

	#sorts the given jobs by title and returns them
	def sort_by_date_posted(jobs)
		@jobs = @jobs.sort_by(&:date_posted).reverse #if params[:SortName].present?
	end

end
