class UsersController < ApplicationController
  def home
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      sign_in(@user)
      redirect_to events_path
    else
      redirect_to root_path
    end
  end

  def users_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :phone_number
    )
  end

  def show

  end
end
