Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'admin/users/new', to: 'admin/users#new'
  get 'admin/users/edit', to: 'admin/users#edit'
  #post 'admin/users/new', to: 'admin/users#new'
  #post 'admin/users/edit', to: 'admin/users#edit'


  namespace :admin do
    resources :users
  end

  #root to:'/login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
