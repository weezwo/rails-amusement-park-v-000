class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def logged_in?
    !!current_user
  end

  private
  helper_method :current_user, :is_admin?

  def is_admin?
    current_user.admin if logged_in?
  end

  def require_admin
    redirect_to(:back) if !is_admin?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to root_path if !logged_in?
  end
end
