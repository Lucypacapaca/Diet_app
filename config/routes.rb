Rails.application.routes.draw do
  namespace :cooks do
    resources :foods
    resources :recipes
  end

  get '/cooks/recipes/new/food_search', to: 'cooks/recipes#food_search'
  get '/cooks/recipes/new/food_search/:id', to: 'cooks/recipes#food_search_show'
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
