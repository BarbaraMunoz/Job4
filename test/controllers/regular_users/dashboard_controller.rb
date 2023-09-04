require "test_helper"

class RegularUsers::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @regular_user = users(:regular_user)
  end

  test "should get index" do
    get regular_user_dashboard_path
    assert_response :success
  end
end
