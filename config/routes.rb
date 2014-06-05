Streams::Application.routes.draw do
  	resources :users
	root 'application#choose_root'

	match '/home', to: 'static_pages#home', via: 'get'
    match '/help', to: 'static_pages#help', via: 'get'
  	match '/about', to: 'static_pages#about', via: 'get'
  	match '/contact', to: 'static_pages#contact', via: 'get'
  	match '/signup', to: 'users#new', via: 'get'
	match '/feed', to: 'users#feed', via: 'get'
	match "/auth/:provider/callback", to: "sessions#create", via: 'get'
	match "/auth/failure", to: "sessions#failure", via: 'get'
	match "/logout", to: "sessions#destroy", via: 'get'
end
