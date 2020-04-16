Rails.application.routes.draw do


  resources :shopping_lists, only: [:index]
  


  get 'items/create'

  root to: 'pages#home'




  devise_for :users, path: 'users', controllers: { 
    sessions: "users/sessions" 
  }
  devise_for :drivers, path: 'drivers', controllers: { 
    sessions: "drivers/sessions" 
  }

  resources :shopping_lists, only: [:index, :new, :create, :show, :edit, :update, :picks, :destroy] do
    resources :items, only: [:new, :create, :show]
  end

  get "/shopping_lists/:user_id/view_all", to: "shopping_lists#view_all", as: "view_all"
  get "/orders/:id/create_order", to: "orders#create_order", as: "create_order"
  get "/orders/:driver_id/picks", to: "orders#picks", as: "picks"
  post "/orders/:id/deliver", to: "orders#mark_as_delivered", as: "order_delivered"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

