Rails.application.routes.draw do

	root "users#home"

	resources :users, only: [:edit, :show, :create]

	get 'users/' => 'users#index', :as => :users_index

	get 'signup', to: 'users#signup'

	resource :session, controller: "sessions", only: [:create, :destroy]

	get "/auth/facebook/callback" => "sessions#create_from_omniauth"

	resources :investments

end
