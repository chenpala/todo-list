class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_sign_in
    redirect_to root unless current_user
  end

  def reject_signed_in_user
    redirect_to home_path if current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
