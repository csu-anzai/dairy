Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  get 'admin/actual_deliveries/daily_delivery_report', 'admin/actual_deliveries#daily_delivery_report'
  ActiveAdmin.routes(self)
  root to: 'home#index'

  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
     resources :users, param: :_username
     post '/auth/login', to: 'authentication#login'
     post '/auth/logout', to: 'authentication#logout'
     post '/auth/change_password', to: 'authentication#change_password'
     post '/auth/forgot_password', to: 'authentication#forgot_password'
     post '/auth/reset_password', to: 'authentication#reset_password'
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
     resources :actual_deliveries, only: [:create, :index, :show, :update, :destroy]
     get '/payments/history', to: 'payments#payment_history'
     get '/payments/due_payment', to: 'payments#due_payment'
     get '/pages/about_us', to: 'pages#about'
     get '/pages/help', to: 'pages#help'
     get '/pages/contact_us', to: 'pages#contact'
    end 
  end 
  get '/*a', to: 'application#not_found'
end