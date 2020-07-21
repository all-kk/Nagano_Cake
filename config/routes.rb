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
<<<<<<< HEAD
<<<<<<< HEAD
  get '/orders/confirm' => 'orders#confirm'
  post '/orders/confirm' => 'orders#confirm'
=======
=======
  get '/members/:id/deactivate' => 'members#deactivate', as:'deactivate_member'
>>>>>>> 7801fd4f4b4ccb99725d3c742f565ef5ed4522f4
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
>>>>>>> 50ce59b2cadfcb2149ff640e1f0d0e6b2d68eb34
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

