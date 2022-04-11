class Public::UsersController < ApplicationController



  def show
    @intakes = Intake.all
    @intake_new = Intake.new
    @user = current_user

    @intake_ingredients =Ingredient.all
    @ingredient_list = Ingredient.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "更新しました。"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "更新できません。"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image)
  end




end