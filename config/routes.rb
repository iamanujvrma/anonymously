Rails.application.routes.draw do

  devise_for :users
  root "home#index"
  get 'dashboard/index'
  resources :users do
  	resources :messages
  end
  
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  #resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'shared#_links'
 
  default_url_options :host => "example.com"
 
end
