require 'test_helper'


class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "check password" do
    user = User.find_by_username("testUser")
    # print user.hashed_password
    assert(user.match_password("123456"), "match password should return true with correct password")
    assert_not(user.match_password(""), "match password should return false with empty password")
    assert_not(user.match_password("1234567"), "match password should return false with incorrect password")



  end


  test "create user with new" do

    @user = User.new(
    )
    assert_not(@user.save, "user save should not be successful with no parameters")

    @user = User.new(
        :username => "wn",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    assert_not(@user.save, "user save should not be successful with too short username")

    @user = User.new(
        :username => "abcdefghijklmnopqrstuv",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    assert_not(@user.save, "user save should not be successful with too long username")

    @user = User.new(
        :username => "abcde",
        :email => "abcdef",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    assert_not(@user.save, "user save should not be successful with incorrect email format")

    @user = User.new(
        :username => "abcde",
        :email => "abc@abc.com",
        :password => "abc",
        :password_confirmation =>"abc",
    )
    assert_not(@user.save, "user save should not be successful with too short password")

    @user = User.new(
        :username => "abcde",
        :email => "abc@abc.com",
        :password => "abcdef",
        :password_confirmation =>"Abcdef",
    )
    assert_not(@user.save, "user save should not be successful with missmatching password")

    @user = User.new(
        :username => "willlll",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    assert(@user.save, "save should be successful with correct parameters")

    @user = User.new(
        :username => "willlll",
        :email => "anotherEmail@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    assert_not(@user.save, "user save should not be successful with duplicate user name")


    @user = User.new(
        :username => "anotherUser",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    assert_not(@user.save, "user save should not be successful with duplicate email")
  end

  # assert_not(@user.match_password("abc1sdfsdf"),"password should be incorrect")
  # assert(@user.match_password("abcdefg"),"password should be correct")

end
