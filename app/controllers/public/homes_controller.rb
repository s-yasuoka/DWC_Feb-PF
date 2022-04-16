class Public::HomesController < ApplicationController

  def about
    @notification_new = Notification.new
    @notifications = Notification.all
  end

end
