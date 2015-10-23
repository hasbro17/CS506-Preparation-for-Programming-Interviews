class CreateProblems < ActiveRecord::Migration
  
  def up
	execute <<-SQL
		CREATE TYPE difficulty AS ENUM ('easy', 'medium', 'hard');
	SQL

    #Need to link with test cases
    create_table :problems do |t|
    	t.text :problem_title
      t.integer :total_score
    	t.text :problem_description
    	t.text :input_description
    	t.text :output_description
    	t.text :sample_input
    	t.text :sample_output
    	t.float :accomplish_rate
    	t.binary :solution_file#Might need to see if just text can be used
    	t.column :difficulty_level, :difficulty
    	t.timestamps null: false
    end
  end


  # NOTE: It's important to drop table before dropping enum.
  def down
  	drop_table :problems

  	execute <<-SQL
  		DROP TYPE difficulty;
  	SQL
  end


end
