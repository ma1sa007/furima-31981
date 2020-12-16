Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
