class AddSolutionFields < ActiveRecord::Migration
  def change
  	rename_column :solution_submissions, :solution_string, :generated_stdout
    add_column :solution_submissions, :submitted_code, :text
    add_column :solution_submissions, :stdin, :text
    add_column :solution_submissions, :generated_errors, :text
  end
end
