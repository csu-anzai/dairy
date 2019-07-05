Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
     resources :item_categories, only: [:create, :index, :show, :update, :destroy]
     resources :item_attributes, only: [:create, :index, :show, :update, :destroy]
     resources :attribute_choices, only: [:create, :index, :show, :update, :destroy]
     resources :items, only: [:create, :index, :show, :update, :destroy]
     resources :item_variants, only: [:create, :index, :show, :update, :destroy]
     resources :units, only: [:create, :index, :show, :update, :destroy]
    end 
  end 
end