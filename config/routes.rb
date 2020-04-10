Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :drivers, path: 'drivers'
  # eg. http://localhost:3000/admins/sign_in

  resources :shopping_lists, only: [:new, :create, :show, :edit, :update] do
    resources :items, only: [:new, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

