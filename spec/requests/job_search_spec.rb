require 'rails_helper'
require 'spec_helper'

RSpec.describe "JobSearch", type: :request do
  describe "return list by search keywords" do
    it "get job_path" do
      get 'http://localhost:3000/jobs'
      expect(response).to have_http_status(200)
    end

    it "visit job page" do
      visit 'http://localhost:3000/jobs'
    end

    it "return all items by search nil" do
      visit 'http://localhost:3000/jobs'
      fill_in "search", :with => ""
      click_button "Search"      
      page.should have_content("Security/Big-Data Research Internship")
      page.should have_content("Applications Engineer (iOS)")
      page.should have_content("Software Engineer")
      page.should have_content("Senior Full-Stack Web Developer")
    end

=begin
    it "return item by search keywords" do
      visit 'http://localhost:3000/jobs'
      fill_in "search", :with => "Web"
      click_button "Search"      
      page.should have_no_content("Security/Big-Data Research Internship")
      page.should have_no_content("Applications Engineer (iOS)")
      page.should have_no_content("Software Engineer")
      page.should have_content("Senior Full-Stack Web Developer")
    end
=end


    it "return list by search keywords" do
      visit 'http://localhost:3000/jobs'
      fill_in "search", :with => "Engineer"
      click_button "Search"
      page.should have_no_content("Security/Big-Data Research Internship")
      page.should have_content("Applications Engineer (iOS)")
      page.should have_content("Software Engineer")
      page.should have_no_content("Senior Full-Stack Web Developer")
    end

=begin
    it "return nil if don't find keywords" do
      visit 'http://localhost:3000/jobs'
      fill_in "search", :with => "One"
      click_button "Search"
      page.should have_no_content("Security/Big-Data Research Internship")
      page.should have_no_content("Applications Engineer (iOS)")
      page.should have_no_content("Software Engineer")
      page.should have_no_content("Senior Full-Stack Web Developer")
    end
=end   
  end

  describe "return list by Position Type select" do
=begin
    it "return jobs of full time " do
      visit 'http://localhost:3000/jobs'
      choose 'job_type_Full_Time'
      click_button "Search"      
      page.should have_no_content("Security/Big-Data Research Internship")
      page.should have_content("Applications Engineer (iOS)")
      page.should have_no_content("Software Engineer")
      page.should have_content("Senior Full-Stack Web Developer")
    end
=end

    it "return jobs of Internship" do
      visit 'http://localhost:3000/jobs'
      choose 'job_type_Internship'
      click_button "Search"
      page.should have_content("Security/Big-Data Research Internship")
      page.should have_no_content("Applications Engineer (iOS)")
      page.should have_content("Software Engineer")
      page.should have_no_content("Senior Full-Stack Web Developer")
    end

  end
end