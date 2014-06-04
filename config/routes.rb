Streams::Application.routes.draw do
  	resources :users
	root 'static_pages#home'
    match '/help',    to: 'static_pages#help',    via: 'get'
  	match '/about',   to: 'static_pages#about',   via: 'get'
  	match '/contact', to: 'static_pages#contact', via: 'get'
  	match '/signup',  to: 'users#new',            via: 'get'
	match "/auth/:provider/callback", to: "sessions#create", via: 'get'
	match "/auth/failure", to: "sessions#failure", via: 'get'
	match "/logout", to: "sessions#destroy", via: 'get'
end
