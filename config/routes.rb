Rails.application.routes.draw do
  # resource :cooks do
  #   get 'new'
  #   get 'edit'
  # end
  #get 'cooks/new'
  
  # resources :cooks do
  #   member do
  #     get 'edit'
  #   end
  # end

  resources :cooks, only: [:index, :show, :create, :edit, :new, :destroy] do
  end

  #get 'cooks/new'
  # get 'cooks/search'
  #get 'cooks/edit'

  #post '/cooks', to: 'cooks#delete' 
 # post '/cooks', to: 'cooks#update' 

  #get 'cooks/new'
 
  post 'cooks/:id', to: 'cooks#update'
  #patch 'cooks/:id', to: 'cooks#update'
  
  #delete 'cooks/:id', to: 'cooks#destroy'
  root to:'cooks#index'
  #resources :cooks
 
  #get 'cooks/:id/edit'
end
