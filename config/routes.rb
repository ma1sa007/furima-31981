Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buyer_informations
  end
  # resources :users, only: [:edit, :update]
end
