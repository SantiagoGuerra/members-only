Rails.application.routes.draw do

  root 'users#new'
  get 'sessions/new'
  get 'users/index'
  get 'posts/new'

  resources :users
  resources :posts


  get '/signup', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
