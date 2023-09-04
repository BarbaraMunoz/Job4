require 'test_helper'

class RegularUsers::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @regular_user = users(:regular_user) 
  end

  test "should get show" do
    sign_in @regular_user
    get regular_users_user_url(@regular_user)
    assert_response :success
  end
end
