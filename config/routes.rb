Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end
 
  root to:'cooks#index'
  resources :cooks 

  #get '/?start_date', to: 'cooks#cooklist'
  #get "cooks/list" => "cooks#list"

 
 

end
