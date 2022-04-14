class Admin::NotificationsController < ApplicationController

  def edit
    @notification = Notification.find(params[:id])
  end

  def create
    @notification_new = Notification.new(notification_params)
    if @notification_new.save
      flash[:notice] = "お知らせを保存しました"
      redirect_to root_path
    else
      flash[:alert] = "保存できません"
      render root_path
    end
  end

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(notification_params)
      flash[:notice] = "更新しました"
      redirect_to root_path
    else
      flash[:alert] = "更新できません"
     render :edit
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :content)
  end
end
