class ProblemsController < ApplicationController

	#Show the list of all problems
	def index		
		#Fetch all problems
		#@problems = Problem.all

		@filterrific = initialize_filterrific(
			Problem,
			params[:filterrific],
			select_options: {
				sorted_by: Problem.options_for_sorted_by,
				with_difficulty_level: Problem.options_for_select
				},
				persistence_id: 'shared_key',
				default_filter_params: {},
				available_filters: [],
				) or return
    	# Get an ActiveRecord::Relation for all problems that match the filter settings.
    	# You can paginate with will_paginate or kaminari.
    	# NOTE: filterrific_find returns an ActiveRecord Relation that can be
    	# chained with other scopes to further narrow down the scope of the list,
    	# e.g., to apply permissions or to hard coded exclude certain types of records.
    	@problems = @filterrific.find.page(params[:page])

		# Respond to html for initial page load and to js for AJAX filter updates.
		respond_to do |format|
			format.html
			format.js
		end

	    # Recover from invalid param sets, e.g., when a filter refers to the
		# database id of a record that doesn’t exist any more.
		# In this case we reset filterrific and discard all filter params.
	rescue ActiveRecord::RecordNotFound => e
	    	# There is an issue with the persisted param_set. Reset it.
	    	puts "Had to reset filterrific params: #{ e.message }"
	    	redirect_to(reset_filterrific_url(format: :html)) and return
	    end



	#Show the specific problem clicked on
	def show
		@problem = Problem.find(params[:id])
		#@user = User.find(FindUserFromSessionOrCookie)
	end

end
