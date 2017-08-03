Rails.application.routes.draw do
  root "static#home"

  resources :attractions, :users
  resources :rides, only: [:create]

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"

  post '/signout', to: "sessions#destroy"
end
