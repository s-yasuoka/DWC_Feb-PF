class Public::UsersController < ApplicationController
  # before_action :check_user, only:
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]


  def show
    @user = current_user
    @intakes = @user.intakes
    @intake_new = Intake.new
    @intake_ingredients =Ingredient.all
    @ingredient_list = Ingredient.all
    @notifications = Notification.all
  end

  def rank
    @user_rank = User.all.order(rank_point: :desc)

    @ranking = 1
    @user_rank.find_each do |user|
      @ranking += 1
      if user.id == current_user.id
        return @ranking
      end
    end
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
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image ,:email)
  end

  # def check_user
  #   if current_user.id != params[:id]
  #     flash[:alert] = "アクセス権限がないため、閲覧できません。"
  #     redirect_to user_path(current_user)
  #   end
  # end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , alert: 'アクセス権限がないため、遷移できません。'
    end
  end



end