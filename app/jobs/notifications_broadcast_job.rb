class NotificationsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user_id, count)
    ActionCable.server.broadcast("notifications_#{user_id}", count: count)
  end
end
