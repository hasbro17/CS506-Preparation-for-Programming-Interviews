class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.text :username
    	t.text :email
    	t.text :password
    	t.text :first_name
    	t.text :last_name
    	t.date :join_date
    	t.text :company
    	t.text :git_accnt
    	t.text :fb_accnt
    	t.binary :resume_pdf
    	t.binary :profile_pic
    	t.timestamps null: false
    end
  end
end
