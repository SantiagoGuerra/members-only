Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/index'
  get 'posts/new'

  resources :users
  resources :posts


  get '/signup', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
