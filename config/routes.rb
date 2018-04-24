Rails.application.routes.draw do
  get 'dashboard/index'

  root "home#index"
  devise_for :users

  resources :messages
  resources :messages do
  	member do
  		get :like
  	end
  end
end
