require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @admin = users(:admin)
    @regular_user = users(:regular_user)
  end

  test "should get new" do
    sign_in @admin
    get new_admin_user_url
    assert_response :success
  end

  test "should create user" do
    sign_in @admin
    assert_difference("User.count") do
      post admin_users_url, params: { user: { first_name: "John", last_name: "Doe", email: "john@example.com", position: "Developer", department: "IT", bio: "Lorem ipsum", role: "regular" } }
    end

    assert_redirected_to admin_dashboard_url
  end

  test "should show user" do
    sign_in @admin
    get admin_user_url(@regular_user)
    assert_response :success
  end

  def destroy
    @user = User.find(params[:id])
    # Eliminar notificaciones relacionadas con el usuario
    Notification.where(user_id: @user.id).destroy_all
    @user.destroy
    redirect_to admin_users_path, notice: 'Usuario eliminado con éxito.'
  end

  test "should get index" do
    sign_in @admin
    get admin_users_url
    assert_response :success
  end
end
