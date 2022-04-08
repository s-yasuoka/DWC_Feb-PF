class Public::IntakesController < ApplicationController

  def edit
    @intake = Intake.find(params[:id])
    # @intake_ingredient = @intake.ingredients.pluck(:name).join(",")
  end

  def create
    @intake_new = Intake.new(intake_parameter)
    @intake.user_id = current_user.id
    if @intake.save
      redirect_to my_page_path
    else
      redirect_to "/my_page"
    end
  end

  def update
    @intake = Intake.find(params[:id])
    # @intake_ingredient = params[:intake][:name].split(",")
    if @intake_new.update(intake_parameter)

      redirect_to "/my_page"
    else
      render :edit
    end
  end

  private
  def intake_parameter
    params.require(:intake).permit(:user_id, :menu_name, :ingredient_id, :status, :start_time, :memo)
  end
end
