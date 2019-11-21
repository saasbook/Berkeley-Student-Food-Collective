Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'discovery', action: :index, controller: 'discovery'
  resources :vendors, :products, :ownerships, :tags, :my_vendors, :my_products, :product_tags, :producer_tags
  
  namespace :admin do 
  	resources :products, :vendors, :my_vendors, :my_products, :tags, :product_tags, :producer_tags, :product_tag_categories
  end
  
  root :to => redirect('/discovery')
  
  get 'admin' => redirect('admin/my_vendors')
end
