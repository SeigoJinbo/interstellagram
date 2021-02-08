class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications_as_receiver
  end
end
