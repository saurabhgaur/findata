Findata::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :create, :destroy] do
  	resources :addresses
  end

  resources :family_members, only: [:create, :destroy] do
  	resources :addresses
  end

  resources :investments, only: [:create, :destroy]
  
  
end
