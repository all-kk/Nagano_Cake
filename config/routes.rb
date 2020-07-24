Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :member do
  resources :members
  resources :products, only:[:index, :show]
  resources :orders, only:[:index, :show, :new, :create]
  resources :shippings, only:[:index, :create, :edit, :update, :destroy]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items
  get '/orders/confirm' => 'orders#confirm'
  post '/orders/confirm' => 'orders#confirm'
  get '/members/:id/deactivate' => 'members#deactivate', as:'deactivate_member'
  get '/orders/:id/thanks' => 'orders#thanks', as: 'thanks_order'
  put "/members/:id/hide" => "members#hide", as: 'members_hide'
end

  root 'homes#top'
  get 'home/about' => 'homes#about'
    namespace :admins do
      get 'top' => 'top'
      get '/search/search' => 'search#search'
    	resources :orders, only:[:index, :show, :update]
    	resources :order_details, only:[:update]
    	resources :genres, only:[:index, :create, :edit, :update]
    	resources :members, only:[:index, :create, :edit, :show, :update]
    	resources :products
    end
end

