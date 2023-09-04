require "test_helper"

class Admin::AppliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @admin = users(:admin)
    @job_offer = job_offers(:one)
  end

  test "should get index" do
    sign_in @admin
    get url_for(action: "index", controller: "admin/applies")
    assert_response :success
  end

  test "should show applicants for a job offer" do
    sign_in @admin
    get admin_job_offer_apply_url(job_offer_id: @job_offer.id, id: @job_offer.applies.first.id)
    assert_response :success
  end
end


