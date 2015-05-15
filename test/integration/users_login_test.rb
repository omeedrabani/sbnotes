require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

    ##
    #@todo:: rewrite test to work with current routes
#   test "login with valid information followed by logout" do
#     get login_path
#     #post login_path, session: { email: @user.email, password: 'password' }
#     post login_path, session: { email: users(:geralt).email, password: 'password' }
#     #assert logged_in?
#     #assert_redirected_to @user
#     follow_redirect!
#     assert_template 'notes/index'
#     assert_select "a[href=?]", login_path, count: 0
#     assert_select "a[href=?]", logout_path
#     assert_select "a[href=?]", user_path(@user)
#     delete logout_path
#     assert_not logged_in?
#     assert_redirected_to root_url
#     # Simulate a user clicking logout in a second window.
#     delete logout_path
#     follow_redirect!
#     assert_select "a[href=?]", login_path
#     assert_select "a[href=?]", logout_path,      count: 0
#     assert_select "a[href=?]", user_path(@user), count: 0
#   end
end