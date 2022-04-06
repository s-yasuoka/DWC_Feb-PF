class Public::UsersController < ApplicationController
  def show
    @intakes = Intake.all
  end

  def edit
  end
end
