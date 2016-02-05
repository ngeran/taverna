Rails.application.routes.draw do

  resources :photos

  resources :albums

  resources :gallery

  namespace :api, defaults: {format: 'json'}  do 
    namespace :v1 do
        resources :items, :only => [:index, :show]
        resources :categories, :only => [:index]
        resources :albums, :only => [:index]
        resources :photos, :only => [:index]
    end
  end
  
  root 'site#index'
  get 'dashboard/index'

  resources :items
  resources :categories
  resources :catalogs
  
  
  devise_for :users,  :controllers => { :registrations => "users/registrations" }, :skip => [:sessions ]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    get 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  resources :users  do
    collection do
      patch '/users/:id', to: 'users#update_password', as: 'update_password'
      put '/users/:id', to: 'users#update_password'
      patch 'update_profile'
    end
  end
  get "dashboard/user_profile"
  
  resources :items do 
    collection { post :import}
  end
  resources :categories do 
    collection {post :import}
  end
  resources :catalogs do 
    collection { post :import}
  end
  
end
