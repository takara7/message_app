Rails.application.routes.draw do
  authenticated :user do
    root "talks#index"
  end
  root "home#index"

  devise_for :users
  resources :talks, only: [:index, :create, :show, :destroy]
  resources :users, only: [:index, :show]
  resources :friendships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
