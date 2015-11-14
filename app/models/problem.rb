require_relative "../../enums"

class Problem < ActiveRecord::Base
	include Enums # can't include this for some reason


	filterrific(
		default_filter_params: { sorted_by: 'created_at_desc' },
		available_filters: [
			:sorted_by,
			:search_query,
			:with_difficulty_level
		]
		)

	scope :search_query, lambda { |query|
    	# Filters problems whose name or area matches the query
    	return nil  if query.blank?

    	# condition query, parse into individual keywords
    	terms = query.downcase.split(/\s+/)

    	# replace "*" with "%" for wildcard searches,
  		# append '%', remove duplicate '%'s
  		terms = terms.map { |e|
  			(e.gsub('*', '%') + '%').gsub(/%+/, '%')
  		}
		# configure number of OR conditions for provision
		# of interpolation arguments. Adjust this if you
		# change the number of OR conditions.
		num_or_conds = 2
		where(
			terms.map { |term|
				"(LOWER(problems.problem_title) LIKE ? OR LOWER(problems.problem_area) LIKE ?)"
			}.join(' AND '),
			terms.map { |e| [e] * num_or_conds }.flatten
		)
  	}


  	scope :sorted_by, lambda { |sort_option|
  		# extract the sort direction from the param value.
	  	direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	  	case sort_option.to_s
	  	when /^created_at_/
	    # Simple sort on the created_at column.
	    # Make sure to include the table name to avoid ambiguous column names.
	    # Joining on other tables is quite common in Filterrific, and almost
	    # every ActiveRecord table has a 'created_at' column.
	    order("problems.created_at #{ direction }")
	  else
	    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	  end
	}


  	# filters on 'country_id' foreign key
  	scope :with_difficulty_level, lambda { |difficulty_levels|
  		where(difficulty_level: [*difficulty_levels])
  	}

  	# This method provides select options for the `sorted_by` filter select input.
  	# It is called in the controller as part of `initialize_filterrific`.
  	def self.options_for_sorted_by
  	[
   	   ['Registration date (newest first)', 'created_at_desc'],
    ]
  end

  	#Returns array of difficulty level for select
  	def self.options_for_select
  		Enums::problem_difficulty_enum.keys
  	end

end
