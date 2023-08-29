class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.where(role: 'regular').order(created_at: :desc)
  end
  
end
