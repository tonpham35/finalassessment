Rails.application.routes.draw do
	root "users#home"

	resources :users, only: [:show, :create]

	get 'signup', to: 'users#signup'

	resource :session, controller: "sessions", only: [:create, :destroy]


end
