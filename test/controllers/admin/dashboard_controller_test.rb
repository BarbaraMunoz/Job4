require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in @admin
    get admin_dashboard_path
    assert_response :success
  end
end

