class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def destroy_user
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_dashboard_path, notice: 'User was successfully deleted.'
  end
  
end
