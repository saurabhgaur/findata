Findata::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:new, :edit, :update, :show, :create, :destroy] do
  	resources :addresses, only:  [:new, :edit, :create, :destroy, :update] 
  end

  resources :users do
    member do
      get 'sendmail'
    end
  end



  resources :family_members, only: [:new, :edit, :update, :create, :destroy] do
  	resources :addresses, only:  [:new, :edit, :create, :destroy, :update] 
  end

  resources :investments, only: [:new, :edit, :create, :destroy, :update]
  
  
end
