Rails.application.routes.draw do
  devise_for :users

  resources :users

  root "user#index"

  resources :groups do
    resources :entities
  end
end
