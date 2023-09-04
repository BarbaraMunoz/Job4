require 'test_helper'

class RegularUsers::JobOffersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @regular_user = users(:regular_user)
    @job_offer = job_offers(:one) 
  end

  test "should get index" do
    sign_in @regular_user
    get regular_users_job_offers_url
    assert_response :success
  end

  test "should get show" do
    sign_in @regular_user
    get regular_users_job_offer_url(@job_offer)
    assert_response :success
  end
end

