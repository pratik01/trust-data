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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(set_user_params)
      redirect_to :controller => "users",:action=>"profile"
    else
      render 'edit'
    end
  end

  def profile
    @email = login_user
  end

  def change_password
    @user = User.find(current_user.id)
    puts @user.password
    puts params[:user][:password]
    if @user.password==params[:user][:current_password ]
      if @user.update(set_user_params)
        # Sign in the user by passing validation in case their password changed
        sign_in @user, :bypass => true
        redirect_to root_path
      else
        render "edit"
      end
    else
      puts "password do not match"
      render "profile"
    end
  end

  def approve_user
    @user = User.find(params[:id])
    @user.approved = true
    @user.save
    redirect_to root_path
  end

  private

  def set_user_params
    params.required(:user).permit!
  end
end
