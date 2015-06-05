require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post users_path, user: { name: "",
									 email: "invalid",
									 password: "bat",
									 password_confirmation: "man" }
		end
		assert_template 'users/new'
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: { name: "Example User",
												  email: "valid@email.com",
												  password: "swordss",
												  password_confirmation: "swordss" }
		end
		assert_template 'users/show'
	end
end
