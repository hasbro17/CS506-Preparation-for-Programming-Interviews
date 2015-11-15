require 'rails_helper'
require 'spec_helper'

RSpec.describe "UserCreations", type: :request do
  describe "user_creations" do
    it "get new_user_path" do
      get new_user_path
      expect(response).to have_http_status(200)
    end

    it "visit user creation page" do
      visit new_user_path

      # fill_in "Email", :with => "anewuser@wisc.edu"
      # fill_in "Password", with => "123456"
      # fill_in "Password Confirmation", with => "123456"
    end

    it "create empty account should fail" do
      visit new_user_path
      page.should have_content("Sign Up")
      click_button "Signup"
      page.should have_content("Form is invalid")

    end

    it "login with the newly created user" do
      visit new_user_path
      click_link "Log in"
      page.should have_content("Log in")
      page.should have_content("Profile")
      page.should have_content("newUser")
      page.should have_content("newUser@wisc.edu")
      click_link "Logout"
      page.should have_content("You've successfully logged out")

    end
  end
end
