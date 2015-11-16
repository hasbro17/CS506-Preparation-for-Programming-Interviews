require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

test "create user with controller" do

  @newUser = User.create(
      :username => "newUser",
      :email => "newUser@gmail.com",
      :password => "123456",
      :password_confirmation =>"123456",
  )
  user = User.find_by_username("newUser")
  assert_not_nil(user,"user should not be nil")
  assert_instance_of(User, user, "user should be instance of User")
end

end
