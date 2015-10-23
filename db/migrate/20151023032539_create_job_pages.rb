class CreateJobPages < ActiveRecord::Migration
  def change
  	create_table :job_pages do |t|
  		t.text :link_name
  		t.text :link

  		t.references :job, index: true, foreign_key: true

    	t.timestamps null: false
    end
  end
end
