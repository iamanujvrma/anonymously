Rails.application.routes.draw do
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'shared#_links'
devise_for :users
devise_scope :user do
  root to: "devise/sessions#new"
end
 
end
