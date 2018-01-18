Rails.application.routes.draw do
  
  root 'application#home'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  
  post '/attractions/:id', to: 'rides#create'
  
  resources :users
  resources :attractions
  resources :rides, only: [:new, :create]
end