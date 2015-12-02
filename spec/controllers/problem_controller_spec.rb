require 'rails_helper'
require 'spec_helper'

describe "problem_controller_test" do
 it "search feature" do
   @problems = Problem.search(:search).order("created_at DESC")
   expect(Problem.find(1)).to be_truthy
 end

=begin
 it "filter feature" do
   @problems = @problems.difficulty_level(:difficulty_level)
   expect(Problem.find(1)).to be_truthy
 end

 it "sort by name feature" do
   @problems = @problems.sort_by &:problem_title 
   expect(Problem.find(1)).to be_truthy
 end
=end

end