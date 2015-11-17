require 'rails_helper'
require 'spec_helper'

RSpec.describe "ProblomSearch", type: :request do
  describe "return list by search keywords" do
    it "get probloms_path" do
      get 'http://localhost:3000/problems'
      expect(response).to have_http_status(200)
    end

    it "visit problems page" do
      visit 'http://localhost:3000/problems'
    end

    it "return all items by search nil" do
      visit 'http://localhost:3000/problems'
      fill_in "search", :with => ""
      click_button "Search"      
      page.should have_content("Detect Cycle")
      page.should have_content("Merge two sorted linked lists")
      page.should have_content("Insert a node at the tail of a linked list")
      page.should have_content("Hello World Test")
      page.should have_content("Binary Search Tree : Insertion")
    end

    it "return item by search keywords" do
      visit 'http://localhost:3000/problems'
      fill_in "search", :with => "Binary"
      click_button "Search"      
      page.should have_no_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")
      page.should have_no_content("Insert a node at the tail of a linked list")
      page.should have_no_content("Hello World Test")
      page.should have_content("Binary Search Tree : Insertion")
    end

    it "return list by search keywords" do
      visit 'http://localhost:3000/problems'
      fill_in "search", :with => "Insert"
      click_button "Search"
      page.should have_no_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")      
      page.should have_no_content("Hello World Test")
      page.should have_content("Binary Search Tree : Insertion")          
      page.should have_content("Insert a node at the tail of a linked list")
    end

    it "return nil search but don't find keywords" do
      visit 'http://localhost:3000/problems'
      fill_in "search", :with => "One"
      click_button "Search"
      page.should have_no_content("Binary Search Tree : Insertion")
      page.should have_no_content("Insert a node at the tail of a linked list")
      page.should have_no_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")
      page.should have_no_content("Hello World Test")
    end
  end

  describe "return list by difficulty select" do
    it "return problems of easy level " do
      visit 'http://localhost:3000/problems'
      choose 'difficulty_level_Easy'
      click_button "Search"      
      page.should have_no_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")
      page.should have_content("Insert a node at the tail of a linked list")
      page.should have_content("Hello World Test")
      page.should have_content("Binary Search Tree : Insertion")
    end


    it "return problems of medium level" do
      visit 'http://localhost:3000/problems'
      choose 'difficulty_level_Medium'
      click_button "Search"
      page.should have_no_content("Detect Cycle")
      page.should have_content("Merge two sorted linked lists")      
      page.should have_no_content("Hello World Test")
      page.should have_no_content("Binary Search Tree : Insertion")          
      page.should have_no_content("Insert a node at the tail of a linked list")
    end

    it "return problems of hard level" do
      visit 'http://localhost:3000/problems'
      choose 'difficulty_level_Hard'
      click_button "Search"
      page.should have_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")      
      page.should have_no_content("Hello World Test")
      page.should have_no_content("Binary Search Tree : Insertion")          
      page.should have_no_content("Insert a node at the tail of a linked list")
    end    
  end

  describe "return list by difficulty select" do
    it "return problems of easy level " do
      visit 'http://localhost:3000/problems'
      choose 'difficulty_level_Easy'
      click_button "Search"      
      page.should have_no_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")
      page.should have_content("Insert a node at the tail of a linked list")
      page.should have_content("Hello World Test")
      page.should have_content("Binary Search Tree : Insertion")
    end


    it "return problems of medium level" do
      visit 'http://localhost:3000/problems'
      choose 'difficulty_level_Medium'
      click_button "Search"
      page.should have_no_content("Detect Cycle")
      page.should have_content("Merge two sorted linked lists")      
      page.should have_no_content("Hello World Test")
      page.should have_no_content("Binary Search Tree : Insertion")          
      page.should have_no_content("Insert a node at the tail of a linked list")
    end

    it "return problems of hard level" do
      visit 'http://localhost:3000/problems'
      choose 'difficulty_level_Hard'
      click_button "Search"
      page.should have_content("Detect Cycle")
      page.should have_no_content("Merge two sorted linked lists")      
      page.should have_no_content("Hello World Test")
      page.should have_no_content("Binary Search Tree : Insertion")          
      page.should have_no_content("Insert a node at the tail of a linked list")
    end    
  end

end
