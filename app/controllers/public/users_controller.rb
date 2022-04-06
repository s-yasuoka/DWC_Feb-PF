class Public::UsersController < ApplicationController
  # before_action :check_correct_user


  def show
    @intakes = Intake.all
    @intake = Intake.new
  end

  def edit
  end


  # private
  # def check_correct_user
  #   @user = User.find(params[:id])
  #   unless @user == current_user
  #     redirect_to user_path(current_user)
  #   end
  # end



end