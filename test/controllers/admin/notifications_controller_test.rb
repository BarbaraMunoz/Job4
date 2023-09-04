require "test_helper"

class Admin::NotificationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  def setup
    @admin = users(:admin)
  end

  test "should get index" do
    sign_in @admin
    get admin_notifications_path
    assert_response :success
  end

  test "should get show" do
    sign_in @admin
  
    # Supongamos que tienes una notificación en tus fixtures llamada 'notification'
    notification = notifications(:one)
  
    # Asegúrate de que la notificación exista
    assert_not_nil notification
  
    # Accede a la vista de una notificación específica
    get admin_notification_path(notification)
    assert_response :success
  end
  
end
