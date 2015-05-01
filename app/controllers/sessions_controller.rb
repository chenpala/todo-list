class SessionsController < ApplicationController
  before_action :reject_signed_in_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "登入成功！"
      redirect_to home_path
    else
      flash.now[:danger] = "帳號或密碼有誤！"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
