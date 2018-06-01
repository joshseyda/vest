Rails.application.routes.draw do
  resources :portfolios
  devise_for :users
  resources :homes
  resources :users
  resources :home
  root to: "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
