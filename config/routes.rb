Rails.application.routes.draw do
  namespace :cooks do
    resources :foods
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
  
  get '/cooks/search' , to:'cooks#index'
  root to:'cooks#index'
  resources :cooks 

end
