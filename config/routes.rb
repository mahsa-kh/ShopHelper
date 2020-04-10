Rails.application.routes.draw do


  root to: 'pages#home'

  devise_for :users, path: 'users'
  # eg. http://localhost:3000/users/sign_in
  devise_for :drivers, path: 'drivers'
  # eg. http://localhost:3000/admins/sign_in


  resources :shopping_lists, only: [:new, :create, :show, :edit, :update, :picks] do
    resources :items, only: [:new, :create, :show]
  end

  get "/orders/:id/create_order", to: "orders#create_order", as: "create_order"
  get "/orders/:driver_id/picks", to: "orders#picks", as: "picks"
  post "/orders/:id/deliver", to: "orders#mark_as_delivered", as: "order_delivered"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

