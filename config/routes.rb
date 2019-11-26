Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]
  get '/supersecret', to: 'admins#new', as: 'signup'
  get '/seealladmins', to: 'admins#index', as: 'index'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'discovery', action: :index, controller: 'discovery'

  resources :admins, only: [:new, :create, :show, :edit, :update, :destroy, :delete] 
  resources :vendors, :products, :ownerships, :tags, :my_vendors, :my_products, :product_tags, :producer_tags, :product_tag_category
  
  root :to => redirect('/discovery')
  get 'map' => redirect('vendors/maps')
end
