Rails.application.routes.draw do
  resources :admins
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'admins#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'discovery', action: :index, controller: 'discovery'
  resources :vendors, :products, :ownerships, :tags, :my_vendors, :my_products, :product_tags, :producer_tags
  
  namespace :admin do 
  	resources :products, :vendors, :my_vendors, :my_products, :tags, :product_tags, :producer_tags, :product_tag_categories
  end
  
  root :to => redirect('/discovery')
  
  get 'admin' => redirect('admin/vendors')
  get 'map' => redirect('vendors/maps')
end
