class UsersController < ApplicationController
  before_action :reject_signed_in_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "註冊成功！"
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash.now[:danger] = "資料有誤！請確認"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
