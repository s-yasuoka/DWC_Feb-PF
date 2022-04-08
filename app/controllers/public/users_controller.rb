class Public::UsersController < ApplicationController



  def show
    @intakes = Intake.all
    @intake_new = Intake.new
    @user = current_user
    @intake_ingredients =Ingredient.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to "/my_page"
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image)
  end




end