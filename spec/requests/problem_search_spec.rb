require 'rails_helper'
require 'spec_helper'

RSpec.describe "ProblomSearch", type: :request do
  describe "return list by search keywords" do
    it "get problom_path" do
      get new_user_path
      expect(response).to have_http_status(200)
    end
=begin

    it "visit user creation page" do
      visit new_user_path
    end

    it "create empty account should fail" do
      visit new_user_path
      page.should have_content("Sign Up")
      click_button "Signup"
      page.should have_content("Form is invalid")
    end

    it "create valid account should success" do
      visit new_user_path
      fill_in "username_field", :with => "anewuser"
      fill_in "email_field", :with => "anewuser@wisc.edu"
      fill_in "password_field", :with => "123456"
      fill_in "pass_conf_field", :with => "123456"
      click_button "Signup"
      page.should have_content("You signed up successfully")
    end

    it "login with the newly created user" do
      visit new_user_path
      fill_in "username_field", :with => "anewuser"
      fill_in "email_field", :with => "anewuser@wisc.edu"
      fill_in "password_field", :with => "123456"
      fill_in "pass_conf_field", :with => "123456"
      click_button "Signup"
      page.should have_content("You signed up successfully")

      click_link "Log in"
      fill_in "user_field", :with => "anewuser"
      fill_in "password_field", :with => "123456"
      click_button "Log In"
      # page.should have_content("Log in")
      page.should have_content("Profile")
      page.should have_content("anewuser")
      page.should have_content("anewuser@wisc.edu")
      click_link "Logout"
      page.should have_content("You've successfully logged out")

    end
=end

  end
end
