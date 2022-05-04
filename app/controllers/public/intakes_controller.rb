class Public::IntakesController < ApplicationController
  before_action :authenticate_user!

  def new
    @intake_new = Intake.new
    @intake_ingredients =Ingredient.all
    @ingredient_list = Ingredient.all
    @notifications = Notification.all
  end

  def edit
    @intake = Intake.find(params[:id])
    @ingredient_list = @intake.ingredients.pluck(:name)
    @intake_ingredients = @intake.ingredients.all
  end

  def create
    @intake_new = Intake.new(intake_parameter)
    @intake_new.user_id = current_user.id
    ingredient_list = params[:intake][:name]
    if @intake_new.save
      # tags = Vision.get_image_data(@intake_new.image) #vision API
      # tags.each do |tag|
      #   intake.memos.create(name: tag)
      # end
      tags = Vision.get_image_data(@intake_new.image) #vision API
      tags.each do |tag|
        intake.ingredients.create(name: tag)
      end

      if ingredient_list.nil?
        ingredient_list = Array.new
      end
      @intake_new.save_ingredient(ingredient_list) #食材

      current_user.point +=  @intake_new.point.to_i #ポイント
      current_user.rank_status = current_user.point.to_i
      current_user.update(point: current_user.point, rank_status: current_user.rank_status)

      flash[:notice] = "記録しました。"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "記録できませんでした。"
      redirect_to user_path(current_user)
    end

  end

  def image_data
    image = Vision.get_async_image_data(params[:image])
    render json: {
      image: image
    }
    # vision api を呼び出す
    # vision apiの結果を返却する
  end

  def update
    @intake = Intake.find(params[:id])
    ingredient_list = params[:intake][:name]


    if @intake.update(intake_parameter)
      #byebug
      if ingredient_list.nil?
        ingredient_list = Array.new
      end
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

    current_user.point -=  @intake.point.to_i #ポイント
    current_user.rank_status = current_user.point.to_i
    current_user.update(point: current_user.point, rank_status: current_user.rank_status)

    flash[:notice] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  private
  def intake_parameter
    params.require(:intake).permit(:image, :menu_name, :status, :start_time, :memo)
  end

end
