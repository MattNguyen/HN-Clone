class SessionsController < ApplicationController
  def new
  end

	def create
	  auth_hash = request.env['omniauth.auth']
	 
	  if session[:user_id]
	    User.find(session[:user_id]).add_provider(auth_hash)
	 
	    redirect_to :root
	    flash[:success] = "You can now login using #{auth_hash["provider"].capitalize} too!"
	  else
	    auth = Authorization.find_or_create(auth_hash)
	 
	    session[:user_id] = auth.user_id
	 
	    redirect_to :root
	    flash[:success] = "Welcome to Hackifesto, @#{User.find(session[:user_id]).twitter_handle}!"
	  end
	end

  def failure
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to :root
  	flash[:success] = "You've logged out!"
  end
end
