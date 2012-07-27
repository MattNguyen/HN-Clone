HnClone::Application.routes.draw do

  
	[:comments, :stories].each do |resource|
		resources(resource) do
			resources :comments
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