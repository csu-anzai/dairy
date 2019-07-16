Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
     resources :item_categories, only: [:create, :index, :show, :update, :destroy]
     resources :item_attributes, only: [:create, :index, :show, :update, :destroy]
     resources :attribute_choices, only: [:create, :index, :show, :update, :destroy]
     resources :items, only: [:create, :index, :show, :update, :destroy]
     resources :item_variants, only: [:create, :index, :show, :update, :destroy]
     resources :units, only: [:create, :index, :show, :update, :destroy]
     resources :users, only: [:create, :index, :show, :update, :destroy]
     resources :vendors, only: [:create, :index, :show, :update, :destroy]
     resources :customers, only: [:create, :index, :show, :update, :destroy]
     resources :delivery_executives, only: [:create, :index, :show, :update, :destroy]
     resources :addresses, only: [:create, :index, :show, :update, :destroy]
     resources :locations, only: [:create, :index, :show, :update, :destroy]
     resources :batches, only: [:create, :index, :show, :update, :destroy]
     resources :stocks, only: [:create, :index, :show, :update, :destroy]
     resources :subscriptions, only: [:create, :index, :show, :update, :destroy]
     resources :addons, only: [:create, :index, :show, :update, :destroy]
     resources :deliveries, only: [:create, :index, :show, :update, :destroy]
    end 
  end 
end