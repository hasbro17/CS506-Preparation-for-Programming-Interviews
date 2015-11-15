ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  @testUser = User.new(
      :username => "testUser",
      :email => "testuser@gmail.com",
      :password => "123456",
      :password_confirmation =>"123456",
  )
  @testUser.save




end
