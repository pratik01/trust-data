class UsersController < ApplicationController
  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end

  def show
    @email = User.current_user_data
    puts @email
  end

  def profile
    @email = login_user
    puts @email
  end

  def approve_user
    @user = User.find(params[:id])
    @user.approved = true
    @user.save
    redirect_to root_path
  end
end
