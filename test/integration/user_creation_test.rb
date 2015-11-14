require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end
  test "user creation" do
        visit new_user_path
        page.should have_content("Sign Up")
  end
end
