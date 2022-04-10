class Public::UsersController < ApplicationController



  def show
    @intakes = Intake.all
    @intake_new = Intake.new
    @user = current_user

    @intake_ingredients =Ingredient.all
    # if params[:ingredient_id]
      @ingredient_list = Ingredient.all
    #   @ingredient = Ingredient.find(params[:ingredient_id])
    #   @intakes = @intake.blogs.public_send.order(time: "DESC").page(params[:page]).per(10)
    #   @intakes_side = Intake.published.order(time: "DESC")
    # else
    #   @ingredient_list = Ingredient.all
    #   @intakes = Intake.public_send.order(time: "DESC").page(params[:page]).per(10)
    #   @intakes_side = Intake.published.order(time: "DESC")
    # end
    # respond_to do |format|
    #   format.html
    #   format.rss { render :layout => false }
    # end

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