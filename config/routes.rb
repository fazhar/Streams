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
	match '/user/home', to: 'users#home', via: 'get', as: "user_home"
	match '/user/:id/settings', to: 'users#settings', via: 'get', as: "user_settings"
	match "/users/:id", to: "users#update", via: 'patch', as: "update_user"

	#sessions routes
	match "/auth/:provider/callback", to: "sessions#create", via: 'get'
	match "/auth/failure", to: "sessions#failure", via: 'get'
	match "/logout", to: "sessions#destroy", via: 'get'

	#conversations routes
	match "/conversations/:id", to: "conversations#update", via: 'patch', as: "update_conversation"
	match "/conversations/:conversation_id/posts/:id", to: "posts#update", via: 'patch', as: "update_conversation_post"
	match "/conversations/:id/follow", to: 'conversations#follow', via: 'post', as: "follow_conversation"
	match "/conversations/:id/unfollow", to: 'conversations#unfollow', via: 'delete', as: "unfollow_conversation"
end
