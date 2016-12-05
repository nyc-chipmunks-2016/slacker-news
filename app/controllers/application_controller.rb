class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :require_login, :authorized?

  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    redirect '/sessions/login' unless logged_in?
  end

  def authorized?(user)
    current_user && current_user == user
  end
end
