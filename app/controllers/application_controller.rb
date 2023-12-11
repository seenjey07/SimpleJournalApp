class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by("username = ? OR email = ?", session[:user_username], session[:user_email])
  end

  def logged_in?
    !current_user.nil?
  end
end
