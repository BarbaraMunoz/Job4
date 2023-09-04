class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @notifications = Notification.order(created_at: :desc)

    @pagy, @notifications = pagy(@notifications) # Gema pagy
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
  end
end
