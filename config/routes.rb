Rails.application.routes.draw do
  get 'pickups/new'
  get 'pickups/index'
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#home'


  get 'create_pickup', to: 'pickups#new', as: 'create_pickup'
  get 'join_pickup', to: 'pickups#index', as: 'join_pickup'

  resources :pickups, only: [:new, :create, :index, :show]
end
