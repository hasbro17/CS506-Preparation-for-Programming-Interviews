class AddJobLinkToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_link, :text, array:true, default: []
  end
end
