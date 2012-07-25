class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  # Makes :current_user accessible to views

  def signed_in?
  	current_user
  end

  def current_user
  	@current_user ||= User.find( session[:user_id] ) if session[:user_id]
  end

  def anonymous_user
  	@anonymous_user ||= User.find_or_create_by_twitter_handle('anyofthemany')
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    redirect_to :root, :notice => "Please sign in." unless signed_in?
  end

  def correct_user
    user = Story.find( params[:id] ).user
    
    redirect_to :root, :notice => "That ain't yours." unless current_user?( user )
  end

  def time_limit_enforcement(story)
    redirect_to :root, :notice => "You're too late." unless story.new?
  end
end