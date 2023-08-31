require "test_helper"

class RegularUsers::AppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get regular_users_applies_create_url
    assert_response :success
  end
end
