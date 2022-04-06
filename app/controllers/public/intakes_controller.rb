class Public::IntakesController < ApplicationController

  def create
    Intake.create(intake_parameter)
    redirect_to public_user_my_page_path
  end

  private
  def intake_parameter
    paraams.require(:intake).permit(:user_id, :menu_id, :ingredient_id, :status, :start_time, :memo)
  end
end
