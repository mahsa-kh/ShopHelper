Rails.application.routes.draw do
  devise_for :drivers

  resources :shopping_lists, only: [:index]
  
  root to: 'pages#home'

  devise_for :users

  resources :shopping_lists, only: [:new, :create, :show, :edit, :update] do
    resources :items, only: [:new, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

