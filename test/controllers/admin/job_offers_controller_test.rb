require "test_helper"

class Admin::JobOffersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @admin = users(:admin) 
    @job_offer = job_offers(:one) 
  end

  test "should get index" do
    sign_in @admin
    get admin_job_offers_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin
    get new_admin_job_offer_url
    assert_response :success
  end

  test "should create job offer" do
    sign_in @admin
    assert_difference("JobOffer.count") do
      post admin_job_offers_url, params: { job_offer: { title: "New Job Offer", description: "Description", requirements: "Requirements" } }
    end

    assert_redirected_to admin_job_offers_url
  end

  test "should show job offer" do
    sign_in @admin
    get admin_job_offer_url(@job_offer)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get edit_admin_job_offer_url(@job_offer)
    assert_response :success
  end

  test "should update job offer" do
    sign_in @admin
    patch admin_job_offer_url(@job_offer), params: { job_offer: { title: "Updated Title" } }
    assert_redirected_to admin_job_offer_url(@job_offer)
    @job_offer.reload
    assert_equal "Updated Title", @job_offer.title
  end

  def destroy
    sign_in @admin
    @job_offer = JobOffer.find(params[:id])
    # Elimina las notificaciones asociadas antes de eliminar la oferta de trabajo
    @job_offer.notifications.destroy_all
  
    @job_offer.destroy
    redirect_to admin_job_offers_path, notice: 'Job offer was successfully destroyed.'
  end
end



