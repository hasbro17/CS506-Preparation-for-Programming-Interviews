#require_relative('utils.rb')
class CreateSolutionSubmissions < ActiveRecord::Migration
  
  def up
=begin
	execute <<-SQL
		CREATE TYPE s_status AS ENUM ('correct', 'incorrect', 'compilation-error', 'run-time-error');
		
	SQL

	Maybe have a separate database of languages, might need it later for editor
	execute <<-SQL
		CREATE TYPE lang AS ENUM ('C', 'Java', 'Python', 'Ruby');
	SQL
=end

    create_table :solution_submissions do |t|
    	t.integer :problem_id
    	t.date :date_submitted
    	#t.column :solution_status, :solution_status_enum
    	t.text :solution_status
    	t.integer :score
    	#t.column :language, :lang
    	t.text :language
    	t.binary :solution_file

    	t.references :user, index: true, foreign_key: true

    	t.timestamps null: false
    end
  end

  # NOTE: It's important to drop table before dropping enum.
  def down
  	drop_table :solution_submissions

 # 	execute <<-SQL
 # 		DROP TYPE s_status;
 # 	SQL

 # 	execute <<-SQL
 # 		DROP TYPE lang;
 # 	SQL

  end

end
