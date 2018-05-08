Rails.application.routes.draw do
  get 'users/index'

  get 'dashboard/index'

  root "home#index" 
  devise_for :users, path: "sessions"
  resources :users
  resources :messages

  resources :messages do
    member do
      get :unlock
    end
  end

  resources :messages do
  	member do
  	  get :like
  	end
  end
  resources :wallet

  resources :wallet_histories

end