class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def logged_in?
  	!@current_user.nil?
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def anonymous_user
  	@anonymous_user ||= User.find_or_create_by_twitter_handle('anyofthemany')
  end
end
