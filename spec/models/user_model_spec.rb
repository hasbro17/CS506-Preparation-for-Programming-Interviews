require 'rails_helper'
require 'spec_helper'



describe "user_model_test" do

  before(:all) do
    @testUser = User.new(
        :username => "testUser",
        :email => "testuser@gmail.com",
        :password => "123456",
        :password_confirmation =>"123456",
    )
    @testUser.save
  end
  after(:all) do
    @testUser = User.find_by_username("testUser")
    @testUser.destroy
  end

  it "check_password" do
    user = User.find_by_username("testUser")
    expect(user.match_password("123456")).to be_truthy #be_truthy: not false nor nil
    expect(user.match_password("")).to be_falsey #be_falsey: false or nil
    expect(user.match_password("abcdefg")).to be_falsey
  end
  it "invalid user should fail" do
    @user = User.new(
    )
    expect(@user.save).to be_falsey

    @user = User.new(
        :username => "wn",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_falsey

    @user = User.new(
        :username => "abcdefghijklmnopqrstuv",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_falsey

    @user = User.new(
        :username => "abcde",
        :email => "abcdef",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_falsey

    @user = User.new(
        :username => "abcde",
        :email => "abc@abc.com",
        :password => "abc",
        :password_confirmation =>"abc",
    )
    expect(@user.save).to be_falsey

    @user = User.new(
        :username => "abcde",
        :email => "abc@abc.com",
        :password => "abcdef",
        :password_confirmation =>"Abcdef",
    )
    expect(@user.save).to be_falsey
  end

  it"create valid user should success" do
    @user = User.new(
        :username => "willlll",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_truthy
  end

  it"recreate existing user should fail" do
    @user = User.new(
        :username => "willlll",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_truthy

    @user = User.new(
        :username => "willlll",
        :email => "anotherEmail@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_falsey


    @user = User.new(
        :username => "anotherUser",
        :email => "abc@gmail.com",
        :password => "abcdefg",
        :password_confirmation =>"abcdefg",
    )
    expect(@user.save).to be_falsey
  end
end


