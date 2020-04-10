Rails.application.routes.draw do

  get 'orders/new'
  get 'orders/create'
  devise_for :drivers


  root to: 'pages#home'

  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :drivers, path: 'drivers'
  # eg. http://localhost:3000/admins/sign_in


  resources :shopping_lists, only: [:new, :create, :show, :edit, :update, :picks] do
    resources :items, only: [:new, :create, :show]
  end

  get "/shopping_lists/:id/create_order", to: "shopping_lists#create_order", as: "create_order"
  get "/shopping_lists/:driver_id/picks", to: "shopping_lists#picks", as: "picks"
  post "/orders/:id/deliver", to: "orders#delivered", as: "order_delivered"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

