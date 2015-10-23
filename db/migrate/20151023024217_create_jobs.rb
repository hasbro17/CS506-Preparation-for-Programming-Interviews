class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	
    	execute <<-SQL
    		CREATE TYPE j_status AS ENUM ('open', 'closed');
    	SQL

    	execute <<-SQL
    		CREATE TYPE j_type AS ENUM ('co-op', 'internship', 'full-time');
    	SQL

    	#Maybe turn these into simple strings and hold a global enum somewhere in a database as a table for job types
    	execute <<-SQL
    		CREATE TYPE r_type AS ENUM ('front-end', 'back-end', 'full-stack', 'mobile');
    	SQL

    	t.text :job_title
    	t.column :job_status, :j_status # Add default values and non-null for all
    	t.integer :num_views
    	t.date :date_posted
    	t.text :job_description
    	t.text :skills_required#All of this could be formatted data, might need to preserve formatting, check out encoding in postgres
    	t.column :job_type, :j_type
    	t.column :role_type, :r_type
    	t.text :location
    	t.binary :company_logo_image
    	t.timestamps null: false
    end
  end


  # NOTE: It's important to drop table before dropping enum.
  def down
  	drop_table :jobs

  	execute <<-SQL
  		DROP TYPE j_status;
  	SQL

  	execute <<-SQL
  		DROP TYPE j_type;
  	SQL

  	execute <<-SQL
  		DROP TYPE r_type;
  	SQL
  end


end
