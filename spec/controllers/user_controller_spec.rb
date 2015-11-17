require 'rails_helper'
require 'spec_helper'



describe "user_controller_test" do
  it "create user with controller" do
    User.create(
        :username => "newUser",
        :email => "newUser@gmail.com",
        :password => "123456",
        :password_confirmation =>"123456",
    )
    user = User.find_by_username("newUser")
    expect(user).to be_truthy
    expect(user).to be_instance_of(User)
  end
  it "create invalid user with controller" do
    User.create(
        :username => "invalidUser",
        :email => "invalidUser@gmail.com",
        :password => "123456",
        :password_confirmation =>"12345678",
    )
    user = User.find_by_username("invalidUser")
    expect(user).to be_falsey
    #expect(user).to be_instance_of(User)
  end
end


