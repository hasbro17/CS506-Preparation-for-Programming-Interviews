require 'rails_helper'
require 'spec_helper'



describe "user_controller_test" do
  it "create user with controller" do
    @newUser = User.create(
        :username => "newUser",
        :email => "newUser@gmail.com",
        :password => "123456",
        :password_confirmation =>"123456",
    )
    user = User.find_by_username("newUser")
    expect(user).to be_truthy
    expect(user).to be_instance_of(User)
  end
end


