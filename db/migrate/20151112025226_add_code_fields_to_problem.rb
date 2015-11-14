class AddCodeFieldsToProblem < ActiveRecord::Migration
  def change
  	add_column :problems, :skeleton_code, :text, array:true, default: []
  	add_column :problems, :supported_langs, :text, array:true, default: []
    add_column :problems, :solution_code, :text, array:true, default: []
    add_column :problems, :expected_stdout, :text, array:true, default: []
    add_column :problems, :given_stdin, :text, array:true, default: []

	add_column :problems, :test_prefix, :text, array:true, default: []
	add_column :problems, :test_suffix, :text, array:true, default: []

  end
end
