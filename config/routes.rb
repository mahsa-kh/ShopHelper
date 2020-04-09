Rails.application.routes.draw do
  get 'shopping_lists/index'
  get 'shopping_lists/new'
  get 'shopping_lists/create'
  get 'shopping_lists/show'
  get 'shopping_lists/edit'
  get 'shopping_lists/update'
  get 'shopping_lists/destroy'
  get 'order/index'
  get 'order/new'
  get 'order/create'
  get 'order/show'
  get 'order/edit'
  get 'order/update'
  get 'order/destroy'
  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/edit'
  get 'items/update'
  get 'items/destroy'
  devise_for :drivers

  root to: 'pages#home'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
