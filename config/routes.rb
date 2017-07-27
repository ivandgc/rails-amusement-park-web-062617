Rails.application.routes.draw do

  resources :attractions
  get '/attractions/:id/get_on_ride', to: 'attractions#get_on_ride', as: 'get_on_ride'

  resources :users, only: [:new, :create, :show]

  root "sessions#homepage"
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
end
