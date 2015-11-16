require 'rails_helper'
require 'spec_helper'

describe "problem" do
	it "returns a keyword that match " do
		fill_in 'search', :with => 'Binary'
		fill_in 'difficulty_level', :with => 'Easy'
		fill_in 'SortName', :with => 'SortName'
		click_button 'Search'
		expect(page).to have_content 'Binary Search Tree : Insertion'
	end
end