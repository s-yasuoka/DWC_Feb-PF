class Public::IntakesController < ApplicationController

  def edit
    @intake = Intake.find(params[:id])
    @ingredient_list = @intake.ingredients.pluck(:name).join(',')
    @intake_ingredients = @intake.ingredients
  end

  def create
    @intake_new = Intake.new(intake_parameter)
    @intake_new.user_id = current_user.id
    ingredient_list = params[:intake][:name].split(',')
    # @ingredient = Ingredient.find(params[:ingredient_id])
    if @intake_new.save
      @intake_new.save_ingredient(ingredient_list)
      # @ingredient.each do |ingredient|
      #   @intake_new.ingredients << ingredient
      # end
      flash[:notice] = "記録しました。"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "記録できませんでした。"
      redirect_to user_path(current_user)
    end
  end

  def update
    @intake = Intake.find(params[:id])
    ingredient_list = params[:intake][:name].split(',')

    if @intake.update(intake_parameter)
      @intake.save_ingredient(ingredient_list)
      flash[:notice] = "更新しました。"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "更新できませんでした。"
      render :edit
    end
  end

  def destroy
    @intake = Intake.find(params[:id])
    @intake.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  private
  def intake_parameter
    params.require(:intake).permit(:user_id, :menu_name, :status, :start_time, :memo)
  end

end
