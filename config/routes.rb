Streams::Application.routes.draw do
  	resources :users

  	resources :conversations do
  		resources :posts
  	end

	root 'application#choose_root'

	#static_pages routes
	match '/home', to: 'static_pages#home', via: 'get'
    match '/help', to: 'static_pages#help', via: 'get'
  	match '/about', to: 'static_pages#about', via: 'get'
  	match '/contact', to: 'static_pages#contact', via: 'get'

  	#users routes
	match '/user_home', to: 'users#home', via: 'get'
	match '/user/:id/settings', to: 'users#settings', via: 'get', as: "user_settings"

	#sessions routes
	match "/auth/:provider/callback", to: "sessions#create", via: 'get'
	match "/auth/failure", to: "sessions#failure", via: 'get'
	match "/logout", to: "sessions#destroy", via: 'get'

	#conversations routes
	match "/conversations/:id", to: "conversations#update", via: 'patch', as: "update_conversation"
end
