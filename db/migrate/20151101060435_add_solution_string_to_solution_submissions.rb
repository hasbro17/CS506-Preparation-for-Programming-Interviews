class AddSolutionStringToSolutionSubmissions < ActiveRecord::Migration
  def change
    add_column :solution_submissions, :solution_string, :text
  end
end
