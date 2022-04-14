class Public::HomesController < ApplicationController

  def about
    @notifications = Notification.all
    @notification_new = Notification.new
  end

end
