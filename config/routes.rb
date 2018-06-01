Rails.application.routes.draw do
  resources :portfolios
  devise_for :users
  resources :homes, :only => [:index]
  resources :users
  resources :nyse
  resources :crypto

  root to: "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
