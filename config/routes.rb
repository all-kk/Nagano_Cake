Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :member do
  resources :members
  resources :products
  resources :orders
  resources :shippings
  resources :cart_items
  get '/orders/confirm' => 'orders#confirm'
  post '/orders/confirm' => 'orders#confirm'
end
  root 'homes#top'
  get 'home/about' => 'homes#about'

    namespace :admins do
      get 'top' => 'top'
    	resources :orders
    	resources :order_details
    	resources :genres
    	resources :members
    	resources :products
    end
end

