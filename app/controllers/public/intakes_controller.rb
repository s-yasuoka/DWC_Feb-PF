class Public::IntakesController < ApplicationController

  def edit
    @intake = Intake.find(params[:id])
  end

  def create
    @intake = Intake.new(intake_parameter)
    @intake.user_id = current_user.id
    if @intake.save
      redirect_to my_page_path
    else
      redirect_to "/my_page"
    end
  end

  private
  def intake_parameter
    params.require(:intake).permit(:user_id, :menu_id, :ingredient_id, :status, :start_time, :memo)
  end
end
