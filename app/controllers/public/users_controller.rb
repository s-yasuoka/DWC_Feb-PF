class Public::UsersController < ApplicationController
  def show
    @intakes = Intake.all
    # @menus = Menu.all
    # @intake = Intake.find(params[:eat_day])
  end

  def edit
  end
end
