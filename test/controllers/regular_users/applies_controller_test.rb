require 'test_helper'

class RegularUsers::AppliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @regular_user = users(:regular_user)
    @job_offer = job_offers(:one)
  end

  test "should create apply" do
    sign_in @regular_user
    job_offer = job_offers(:one) 
  
    post regular_users_job_offer_applies_path(job_offer_id: job_offer.id) 
  
    assert_response :redirect
    assert_redirected_to regular_users_job_offer_path(job_offer)
  end
  
end

