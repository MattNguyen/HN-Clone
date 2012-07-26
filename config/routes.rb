HnClone::Application.routes.draw do

  resources :stories do
  	member do
  		post 'vote'
  	end
  end
  
  resources :users
  resources :votes, :only => [:create, :update]

  root :to => 'stories#index'

	## OmniAuth Sessions -- http://net.tutsplus.com/tutorials/ruby/how-to-use-omniauth-to-authenticate-your-users/
	get '/login', :to => 'sessions#new', :as => :login
	get '/logout', :to => 'sessions#destroy', :as => :logout

	match '/auth/:provider/callback', :to => 'sessions#create'
	match '/auth/failure', :to => 'sessions#failure'

end